class Api::V1::ImagePortfoliosController < ApplicationController
  before_action :authenticate_with_token!, only: [:create]
  respond_to :json
  
  def show
    respond_with ImagePortfolio.find(params[:id])
  end

  def create
    stylist = Stylist.find(params[:stylist_id])
    image_portfolio = stylist.image_portfolios.build(img_params)
    image_portfolio.user = current_user
    if image_portfolio.save
      render json: image_portfolio, status: 200, location: [:api, current_user, stylist, image_portfolio]
    else
      render json: {errors: image_portfolio.errors.full_messages}, status: 422
    end
  end

  private
  def img_params
    params.require(:image_portfolio).permit(:tittle, :caption, :image)
  end
end
