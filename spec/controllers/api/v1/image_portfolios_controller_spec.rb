require 'rails_helper'

RSpec.describe Api::V1::ImagePortfoliosController, type: :controller do
  describe "POST create" do
    context "when its successfully created" do
      before(:each) do
        @user          = FactoryGirl.create :user
        @stylist       = FactoryGirl.create :stylist
        @uploaded_image = FactoryGirl.attributes_for :image_portfolio
        api_authorization_header @user.auth_token
        post :create, params: {user_id: @user.id, stylist_id: @stylist.id, image_portfolio: @uploaded_image}, format: :json
      end

      it "renders a json representation for the portfolio record just created" do
        portfolio_response = json_response
        expect(portfolio_response[:tittle]).to eq @uploaded_image[:tittle]
      end

      it {should respond_with 200}
    end
  end

  describe "GET show" do
    before(:each) do
      @user           = FactoryGirl.create :user
      @stylist        = FactoryGirl.create :stylist
      @uploaded_image = FactoryGirl.create :image_portfolio
      get :show, params: {user_id:@user.id, stylist_id:@stylist.id, id: @uploaded_image.id}, format: :json
    end

    it 'returns information about the appontment in a hash' do
      appointment_response = json_response
      expect(appointment_response[:tittle]).to eq @uploaded_image.tittle
    end
     it {should respond_with 200}
  end
end
