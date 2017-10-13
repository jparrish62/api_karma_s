class Api::V1::AppointmentsController < ApplicationController
  before_action :authenticate_with_token!, only: [:create]
  respond_to :json
  def show
    respond_with Appointment.find(params[:id])
  end

  def create
    stylist = Stylist.find(params[:stylist_id])
    stylist.email = stylist.email.downcase!
    appointment = stylist.appointments.build(app_params)
    appointment.user = current_user
    if appointment.save
      google_appointment = GoogleCalendarAppointment.new(appointment).create_calendar_event
      AppointmentMailer.confirmation_email(current_user).deliver
      render json: { status: 201 }
    else
      render json: {errors: appointment.errors.full_messages}, status: 422
    end
  end

  private

  def app_params
    params.require(:appointment).permit(:name, :start_time, :basic_services,
                   :chemical_services, :color_services,:treatment_services, :weave,
                   :braids, :comment)
  end
end
