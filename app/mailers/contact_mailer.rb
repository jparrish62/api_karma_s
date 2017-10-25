class ContactMailer < ApplicationMailer
  def contact_email(params)
    @stylist       = Stylist.find(params[:stylist])
    @user          = User.find(params[:user])
    @message       = params[:message]
    mail(to:@stylist.email, subject: "Cient request")
  end
end
