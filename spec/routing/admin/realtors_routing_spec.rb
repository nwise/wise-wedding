require 'spec_helper'

describe Admin::RealtorsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/admin_realtors" }.should route_to(:controller => "admin_realtors", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/admin_realtors/new" }.should route_to(:controller => "admin_realtors", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/admin_realtors/1" }.should route_to(:controller => "admin_realtors", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/admin_realtors/1/edit" }.should route_to(:controller => "admin_realtors", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/admin_realtors" }.should route_to(:controller => "admin_realtors", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/admin_realtors/1" }.should route_to(:controller => "admin_realtors", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/admin_realtors/1" }.should route_to(:controller => "admin_realtors", :action => "destroy", :id => "1") 
    end
  end
end
