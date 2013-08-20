require 'spec_helper'

describe "Destinations" do
  describe "GET /destinations" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get destinations_path
      response.status.should be(200)
    end
  end
end
