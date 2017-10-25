require 'rails_helper'

RSpec.describe Api::V1::ContactsController, type: :controller do
  describe "Post contact" do
    before do
      @user    = FactoryGirl.create :user
      @stylist = FactoryGirl.create :stylist
      @message = 'How late are you open'
      post :contact, params: { user: @user.id, stylist: @stylist.id, message: @message },format: :json
    end
    it "returns stylist id when created" do
      expect(json_response[:success]).to eq true
    end

  end
end
