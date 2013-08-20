require "spec_helper"

describe DestinationsController do
  describe "routing" do

    it "routes to #index" do
      get("/destinations").should route_to("destinations#index")
    end

    it "routes to #new" do
      get("/destinations/new").should route_to("destinations#new")
    end

    it "routes to #show" do
      get("/destinations/1").should route_to("destinations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/destinations/1/edit").should route_to("destinations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/destinations").should route_to("destinations#create")
    end

    it "routes to #update" do
      put("/destinations/1").should route_to("destinations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/destinations/1").should route_to("destinations#destroy", :id => "1")
    end

  end
end
