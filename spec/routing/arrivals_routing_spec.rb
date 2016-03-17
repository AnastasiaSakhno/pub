require "spec_helper"

describe ArrivalsController do
  describe "routing" do

    it "routes to #index" do
      get("/arrivals").should route_to("arrivals#index")
    end

    it "routes to #new" do
      get("/arrivals/new").should route_to("arrivals#new")
    end

    it "routes to #show" do
      get("/arrivals/1").should route_to("arrivals#show", :id => "1")
    end

    it "routes to #edit" do
      get("/arrivals/1/edit").should route_to("arrivals#edit", :id => "1")
    end

    it "routes to #create" do
      post("/arrivals").should route_to("arrivals#create")
    end

    it "routes to #update" do
      put("/arrivals/1").should route_to("arrivals#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/arrivals/1").should route_to("arrivals#destroy", :id => "1")
    end

  end
end
