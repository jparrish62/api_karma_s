require 'rails_helper'

RSpec.describe Api::V1::StylistsController, type: :controller do
  describe 'Get show' do
    before(:each) do
      @stylist = FactoryGirl.create :stylist
      get :show, params: {id: @stylist.id}, format: :json
    end

    it "it return stylist in a hash" do
      stylist_response = json_response
      expect(stylist_response[:first_name]).to eq @stylist.first_name
    end
  end

  describe "Get index" do
    before(:each) do
      4.times {FactoryGirl.create :stylist}
      get :index, format: :json
    end

    it "retuns 4 records from database" do
      stylist_response = json_response
      expect(stylist_response).to have_at_least(4).items
    end

    it {should respond_with 200}
  end

  describe "Post create" do
    context "When its succesfully created" do
      before(:each) do
        user = FactoryGirl.create :user
        @stylist_attributes = FactoryGirl.attributes_for :stylist
        api_authorization_header user.auth_token
        post :create, params:{user_id: user.id, stylist: @stylist_attributes}, format: :json
      end

      it "renders the json representation for the product record just created" do
        stylist_response = json_response
        expect(stylist_response[:first_name]).to eq @stylist_attributes[:first_name]
      end

      it {should respond_with 201}
    end
    context 'when is not created' do
      before(:each) do
        user = FactoryGirl.create :user
        @invalid_stylist_attributes = {first_name: " ", last_name: 'Doe'}
        api_authorization_header user.auth_token
        post :create , params: {user_id: user.id, stylist: @invalid_stylist_attributes}, format: :json
      end

      it "renders an errors json" do
        stylist_response = json_response
        expect(stylist_response).to have_key(:errors)
      end

      it "renders the json errors on why the user could not be cteated" do
        stylist_response = json_response
        expect(stylist_response[:errors][:first_name]).to include "can't be blank"
      end

      it {should respond_with 422}
    end
  end

  describe "Put Update" do
    before(:each) do
      @user    = FactoryGirl.create :user
      @stylist = FactoryGirl.create :stylist, user: @user
      api_authorization_header @user.auth_token
    end

    context "when is succesfully updated" do
      before(:each) do
        patch :update, params: {user_id: @user.id, id: @stylist.id, stylist:{email: 't@gmail.com' } }, format: :json
      end
      it "renders the json representation for the updated user" do
        stylist_response = json_response
        expect(stylist_response[:email]).to eq 't@gmail.com'
      end

      it {should respond_with 200}
    end
    context "when is not updated" do
      before(:each) do
        patch :update, params: {user_id: @user.id, id: @stylist.id, stylist: {email: ''}}
      end
      it "renders an errors json" do
        stylist_response = json_response
        expect(json_response).to have_key(:errors)
      end

      it "renders the json erroes on why the user could not be created" do
        stylist_response = json_response
        expect(stylist_response[:errors][:email]).to include "can't be blank"
      end

      it {should respond_with 422}
    end

    describe "DELETE destroy" do
      before(:each) do
        @user = FactoryGirl.create :user
        @stylist = FactoryGirl.create :stylist, user: @user
        api_authorization_header @user.auth_token
        delete :destroy, params: {user_id: @user.id, id: @stylist.id}
      end

      it {should respond_with 204}
    end
  end
end
