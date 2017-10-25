require 'rails_helper'

RSpec.describe Api::V1::AppointmentsController, type: :controller do
  describe "GET show" do
    before(:each) do
      @user        = FactoryGirl.create :user
      @stylist     = FactoryGirl.create :stylist
      @appointment = FactoryGirl.create :appointment
      get :show, params: {user_id:@user.id, stylist_id:@stylist.id, id: @appointment.id}, format: :json
    end

    it 'returns information about the appontment in a hash' do
      appointment_response = json_response
      expect(appointment_response[:name]).to eq @appointment.name
    end
     it {should respond_with 200}
  end

  describe "POST create" do
    context "when its successfully created" do
      before(:each) do
        @user    = FactoryGirl.create :user
        @stylist = FactoryGirl.create :stylist
        @appointment_attributes = FactoryGirl.attributes_for :appointment
        api_authorization_header @user.auth_token
        post :create, params: {user_id: @user.id, stylist_id: @stylist.id, appointment: @appointment_attributes}, format: :json
      end

      it "renders a json representation for the product record just created" do
        appointment_response = json_response
        expect(appointment_response[:status]).to eq 201
      end
      
    end
  end
end
