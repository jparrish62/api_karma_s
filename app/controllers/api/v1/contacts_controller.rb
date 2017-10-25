class Api::V1::ContactsController < ApplicationController
  respond_to :json
  def contact
    ContactMailer.contact_email(contact_params.to_h).deliver_now
    render json: { success: true }
  end

  private

  def contact_params
    params.permit(:stylist, :user, :message)
  end
end
