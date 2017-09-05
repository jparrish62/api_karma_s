require 'rails_helper'

RSpec.describe Appointment, type: :model do
  let (:appointment) {FactoryGirl.build :appointment}
  subject {appointment}
  it {should respond_to(:name)}
  it {should respond_to(:date)}
  it {should respond_to(:time)}
  it {should respond_to(:comment)}
  it {should respond_to(:color_services)}
  it {should respond_to(:chemical_services)}
  it {should respond_to(:treatment_services)}
  it {should respond_to(:weave)}
  it {should respond_to(:braids)}
  it {should respond_to(:basic_services)}
  it {should validate_presence_of :start_time}
  it {should validate_presence_of :name}
  it {should belong_to :user}
  it {should belong_to :stylist}

end
