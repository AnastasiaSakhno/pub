require "spec_helper"

describe MenuPagesController do
  describe "routing" do

    it "routes to #index" do
      get("/menu_pages").should route_to("menu_pages#index")
    end

    it "routes to #new" do
      get("/menu_pages/new").should route_to("menu_pages#new")
    end

    it "routes to #show" do
      get("/menu_pages/1").should route_to("menu_pages#show", :id => "1")
    end

    it "routes to #edit" do
      get("/menu_pages/1/edit").should route_to("menu_pages#edit", :id => "1")
    end

    it "routes to #create" do
      post("/menu_pages").should route_to("menu_pages#create")
    end

    it "routes to #update" do
      put("/menu_pages/1").should route_to("menu_pages#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/menu_pages/1").should route_to("menu_pages#destroy", :id => "1")
    end

  end
end
