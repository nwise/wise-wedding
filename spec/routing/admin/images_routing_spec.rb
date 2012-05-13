require "spec_helper"

describe Admin::ImagesController do
  describe "routing" do

    it "routes to #index" do
      get("/admin_images").should route_to("admin_images#index")
    end

    it "routes to #new" do
      get("/admin_images/new").should route_to("admin_images#new")
    end

    it "routes to #show" do
      get("/admin_images/1").should route_to("admin_images#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin_images/1/edit").should route_to("admin_images#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin_images").should route_to("admin_images#create")
    end

    it "routes to #update" do
      put("/admin_images/1").should route_to("admin_images#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin_images/1").should route_to("admin_images#destroy", :id => "1")
    end

  end
end
