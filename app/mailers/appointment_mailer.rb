class AppointmentMailer < ApplicationMailer
  def confirmation_email(user)
    @user = user
    mail(to:@user.email, subject: "Appointment")
  end
end
