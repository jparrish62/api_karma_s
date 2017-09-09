class Api::V1::StylistsController < ApplicationController
  before_action :authenticate_with_token!, only: [:create, :update]
  respond_to :json
  def show
    respond_with Stylist.find(params[:id])
  end

  def index
    respond_with Stylist.all
  end

  def create
    authorize User
    stylist = current_user.stylist.build(stylist_params)
    if stylist.save
      render json: stylist, status: 201, location: [:api, stylist]
    else
      render json: {errors: stylist.errors}, status: 422
    end
  end

  def update
    stylist = current_user.stylist.find(params[:id])
    if stylist.update_attributes(stylist_params)
      render json: stylist, status: 200, location: [:api, stylist]
    else
      render json: {errors: stylist.errors}, status: 422
    end
  end

  def destroy
    stylist = current_user.stylist.find(params[:id])
    stylist.destroy
    head 204
  end

  private

  def stylist_params
    params.require(:stylist).permit(:user_id, :first_name, :last_name, :bio, :email, :profile_pic)
  end
end
