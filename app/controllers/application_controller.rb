class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :null_session
  include ActionController::MimeResponds
  include Authenticable

  def user_not_authorized
    flash[:alert] = "Access denied"
  end
end
