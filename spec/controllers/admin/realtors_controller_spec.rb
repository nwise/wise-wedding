require 'spec_helper'

describe Admin::RealtorsController do

  def mock_realtor(stubs={})
    @mock_realtor ||= mock_model(Admin::Realtor, stubs)
  end

  describe "GET index" do
    it "assigns all admin_realtors as @admin_realtors" do
      Admin::Realtor.stub!(:find).with(:all).and_return([mock_realtor])
      get :index
      assigns[:admin_realtors].should == [mock_realtor]
    end
  end

  describe "GET show" do
    it "assigns the requested realtor as @realtor" do
      Admin::Realtor.stub!(:find).with("37").and_return(mock_realtor)
      get :show, :id => "37"
      assigns[:realtor].should equal(mock_realtor)
    end
  end

  describe "GET new" do
    it "assigns a new realtor as @realtor" do
      Admin::Realtor.stub!(:new).and_return(mock_realtor)
      get :new
      assigns[:realtor].should equal(mock_realtor)
    end
  end

  describe "GET edit" do
    it "assigns the requested realtor as @realtor" do
      Admin::Realtor.stub!(:find).with("37").and_return(mock_realtor)
      get :edit, :id => "37"
      assigns[:realtor].should equal(mock_realtor)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created realtor as @realtor" do
        Admin::Realtor.stub!(:new).with({'these' => 'params'}).and_return(mock_realtor(:save => true))
        post :create, :realtor => {:these => 'params'}
        assigns[:realtor].should equal(mock_realtor)
      end

      it "redirects to the created realtor" do
        Admin::Realtor.stub!(:new).and_return(mock_realtor(:save => true))
        post :create, :realtor => {}
        response.should redirect_to(admin_realtor_url(mock_realtor))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved realtor as @realtor" do
        Admin::Realtor.stub!(:new).with({'these' => 'params'}).and_return(mock_realtor(:save => false))
        post :create, :realtor => {:these => 'params'}
        assigns[:realtor].should equal(mock_realtor)
      end

      it "re-renders the 'new' template" do
        Admin::Realtor.stub!(:new).and_return(mock_realtor(:save => false))
        post :create, :realtor => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested realtor" do
        Admin::Realtor.should_receive(:find).with("37").and_return(mock_realtor)
        mock_realtor.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :realtor => {:these => 'params'}
      end

      it "assigns the requested realtor as @realtor" do
        Admin::Realtor.stub!(:find).and_return(mock_realtor(:update_attributes => true))
        put :update, :id => "1"
        assigns[:realtor].should equal(mock_realtor)
      end

      it "redirects to the realtor" do
        Admin::Realtor.stub!(:find).and_return(mock_realtor(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(admin_realtor_url(mock_realtor))
      end
    end

    describe "with invalid params" do
      it "updates the requested realtor" do
        Admin::Realtor.should_receive(:find).with("37").and_return(mock_realtor)
        mock_realtor.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :realtor => {:these => 'params'}
      end

      it "assigns the realtor as @realtor" do
        Admin::Realtor.stub!(:find).and_return(mock_realtor(:update_attributes => false))
        put :update, :id => "1"
        assigns[:realtor].should equal(mock_realtor)
      end

      it "re-renders the 'edit' template" do
        Admin::Realtor.stub!(:find).and_return(mock_realtor(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested realtor" do
      Admin::Realtor.should_receive(:find).with("37").and_return(mock_realtor)
      mock_realtor.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the admin_realtors list" do
      Admin::Realtor.stub!(:find).and_return(mock_realtor(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(admin_realtors_url)
    end
  end

end
