require 'rails_helper'
require 'ffaker'
RSpec.describe Stylist, type: :model do
  let (:stylist) {FactoryGirl.build :stylist}
  subject {stylist}
  it {should respond_to(:first_name)}
  it {should respond_to(:last_name)}
  it {should respond_to(:email)}
  it {should respond_to(:bio)}
  it {should validate_presence_of :first_name}
  it {should validate_presence_of :email}
  it {should validate_presence_of :bio}
  it {should belong_to :user}
end
