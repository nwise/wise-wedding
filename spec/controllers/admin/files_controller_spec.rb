require 'spec_helper'

describe Admin::FilesController do

  def mock_file(stubs={})
    @mock_file ||= mock_model(Admin::File, stubs)
  end

  describe "GET index" do
    it "assigns all admin_files as @admin_files" do
      Admin::File.stub!(:find).with(:all).and_return([mock_file])
      get :index
      assigns[:admin_files].should == [mock_file]
    end
  end

  describe "GET show" do
    it "assigns the requested file as @file" do
      Admin::File.stub!(:find).with("37").and_return(mock_file)
      get :show, :id => "37"
      assigns[:file].should equal(mock_file)
    end
  end

  describe "GET new" do
    it "assigns a new file as @file" do
      Admin::File.stub!(:new).and_return(mock_file)
      get :new
      assigns[:file].should equal(mock_file)
    end
  end

  describe "GET edit" do
    it "assigns the requested file as @file" do
      Admin::File.stub!(:find).with("37").and_return(mock_file)
      get :edit, :id => "37"
      assigns[:file].should equal(mock_file)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created file as @file" do
        Admin::File.stub!(:new).with({'these' => 'params'}).and_return(mock_file(:save => true))
        post :create, :file => {:these => 'params'}
        assigns[:file].should equal(mock_file)
      end

      it "redirects to the created file" do
        Admin::File.stub!(:new).and_return(mock_file(:save => true))
        post :create, :file => {}
        response.should redirect_to(admin_file_url(mock_file))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved file as @file" do
        Admin::File.stub!(:new).with({'these' => 'params'}).and_return(mock_file(:save => false))
        post :create, :file => {:these => 'params'}
        assigns[:file].should equal(mock_file)
      end

      it "re-renders the 'new' template" do
        Admin::File.stub!(:new).and_return(mock_file(:save => false))
        post :create, :file => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested file" do
        Admin::File.should_receive(:find).with("37").and_return(mock_file)
        mock_file.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :file => {:these => 'params'}
      end

      it "assigns the requested file as @file" do
        Admin::File.stub!(:find).and_return(mock_file(:update_attributes => true))
        put :update, :id => "1"
        assigns[:file].should equal(mock_file)
      end

      it "redirects to the file" do
        Admin::File.stub!(:find).and_return(mock_file(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(admin_file_url(mock_file))
      end
    end

    describe "with invalid params" do
      it "updates the requested file" do
        Admin::File.should_receive(:find).with("37").and_return(mock_file)
        mock_file.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :file => {:these => 'params'}
      end

      it "assigns the file as @file" do
        Admin::File.stub!(:find).and_return(mock_file(:update_attributes => false))
        put :update, :id => "1"
        assigns[:file].should equal(mock_file)
      end

      it "re-renders the 'edit' template" do
        Admin::File.stub!(:find).and_return(mock_file(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested file" do
      Admin::File.should_receive(:find).with("37").and_return(mock_file)
      mock_file.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the admin_files list" do
      Admin::File.stub!(:find).and_return(mock_file(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(admin_files_url)
    end
  end

end
