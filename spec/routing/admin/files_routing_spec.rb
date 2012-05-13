require 'spec_helper'

describe Admin::FilesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/admin_files" }.should route_to(:controller => "admin_files", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/admin_files/new" }.should route_to(:controller => "admin_files", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/admin_files/1" }.should route_to(:controller => "admin_files", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/admin_files/1/edit" }.should route_to(:controller => "admin_files", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/admin_files" }.should route_to(:controller => "admin_files", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/admin_files/1" }.should route_to(:controller => "admin_files", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/admin_files/1" }.should route_to(:controller => "admin_files", :action => "destroy", :id => "1") 
    end
  end
end
