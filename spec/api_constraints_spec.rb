require 'spec_helper'
require 'api_constraints'
describe ApiConstraints do
  let(:api_constraints_1) {ApiConstraints.new(version: 1)}
  let(:api_constraints_2) {ApiConstraints.new(version: 2, default: true)}

  describe "matches?" do
    it "returns true when the versiion matches the 'Accept ' header" do
      request = double(host: 'api.api_karma_s.dev',
                        headers: {"Accept" => "application/vnd.api_karma_s.v1"})
      expect(api_constraints_1.matches?(request)).to be true
    end

    it "returns the default version when 'default' option is specified" do
      request = double(host: 'api.api_karma_s.dev')
      expect(api_constraints_2.matches?(request)).to be true
    end
  end
end
