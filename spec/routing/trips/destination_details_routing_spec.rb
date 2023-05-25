require "spec_helper"

describe Trips::DestinationDetailsController do
  describe "routing" do

    it "routes to #index" do
      get("/trips/1/destination_details").should route_to("trips/destination_details#index", trip_id: "1")
    end

  end
end
