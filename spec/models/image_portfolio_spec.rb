require 'rails_helper'

RSpec.describe ImagePortfolio, type: :model do
  it {should respond_to(:image)}
  it {should respond_to(:tittle)}
  it {should respond_to(:caption)}
  it {should validate_presence_of :image}
end
