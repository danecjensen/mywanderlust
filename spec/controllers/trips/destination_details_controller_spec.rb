require 'spec_helper'

describe Trips::DestinationDetailsController do
  render_views

  describe "GET index" do
    it "renders without layout" do
      get :index, trip_id: '397960e5e2eed6f662d93c1b8e24bfb5474206ef'
      expect(response).to render_template(layout: nil)
    end
  end
end
