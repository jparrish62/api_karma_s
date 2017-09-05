class GoogleCalendarAppointment
  attr_accessor :appointment

  def initialize(appointment, stylist=nil)
    @stylist     = stylist
    @appointment = appointment
  end

  def initial_call(url)
    Signet::OAuth2::Client.new({
      client_id: CLIENT_ID,
      client_secret: CLIENT_SECRET,
      authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
      scope: CALENDAR_SCOPE,
      redirect_uri: url
    })
  end

  def callback_obj(params, url)
    Signet::OAuth2::Client.new({
      client_id: CLIENT_ID,
      client_secret: CLIENT_SECRET,
      token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
      redirect_uri: url,
      code: params[:code]
    })
  end

  def calendars(access_token)
    client = Signet::OAuth2::Client.new(access_token: access_token)
    client.expires_in = Time.now + 1_000_000
    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client
    service.insert_event("primary", client_appointment)
  end

  def client_appointment
    Google::Apis::CalendarV3::Event.new({
    summary: "New Appointment for #{appointment.stylist.name} Client:#{appointment.name}",
    location: 'Karma Salon',
    description: "Treatment Services #{appointment.treatment_services}, Chemical Services #{appointment.chemical_services},Color services #{appointment.color_services}, Braid #{appointment.braids}, Basic services #{appointment.basic_services}, Weave #{appointment.weave}",
    start: {
    date_time: "#{appointment.start_time.strftime('%Y-%m-%dT%H:%M:%S')}",
    time_zone: 'America/New_York',
    },
      end: {
        date_time: "#{appointment.start_time.strftime('%Y-%m-%dT%H:%M:%S')}",
        time_zone: 'America/New_York',
      }
    });
  end

  def app_date_time
    appointment.appointment_date_time.strftime('%Y-%m-%dT%H:%M:%S')
  end

end
