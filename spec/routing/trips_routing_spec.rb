require "spec_helper"

describe TripsController do
  describe "routing" do

    it "routes to #index" do
      get("/trips").should route_to("trips#index")
    end

    it "routes to #new" do
      get("/trips/new").should route_to("trips#new")
    end

    it "routes to #show" do
      get("/trips/1").should route_to("trips#show", :id => "1")
    end

    it "routes to #edit" do
      get("/trips/1/edit").should route_to("trips#edit", :id => "1")
    end

    it "routes to #create" do
      post("/trips").should route_to("trips#create")
    end

    it "routes to #update" do
      put("/trips/1").should route_to("trips#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/trips/1").should route_to("trips#destroy", :id => "1")
    end

  end
end
