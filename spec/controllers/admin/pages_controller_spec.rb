require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Admin::PagesController do

  def mock_pages(stubs={})
    @mock_pages ||= mock_model(Admin::Pages, stubs)
  end
  
  describe "GET index" do
    it "assigns all admin_pages as @admin_pages" do
      Admin::Pages.stub!(:find).with(:all).and_return([mock_pages])
      get :index
      assigns[:admin_pages].should == [mock_pages]
    end
  end

  describe "GET show" do
    it "assigns the requested pages as @pages" do
      Admin::Pages.stub!(:find).with("37").and_return(mock_pages)
      get :show, :id => "37"
      assigns[:pages].should equal(mock_pages)
    end
  end

  describe "GET new" do
    it "assigns a new pages as @pages" do
      Admin::Pages.stub!(:new).and_return(mock_pages)
      get :new
      assigns[:pages].should equal(mock_pages)
    end
  end

  describe "GET edit" do
    it "assigns the requested pages as @pages" do
      Admin::Pages.stub!(:find).with("37").and_return(mock_pages)
      get :edit, :id => "37"
      assigns[:pages].should equal(mock_pages)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created pages as @pages" do
        Admin::Pages.stub!(:new).with({'these' => 'params'}).and_return(mock_pages(:save => true))
        post :create, :pages => {:these => 'params'}
        assigns[:pages].should equal(mock_pages)
      end

      it "redirects to the created pages" do
        Admin::Pages.stub!(:new).and_return(mock_pages(:save => true))
        post :create, :pages => {}
        response.should redirect_to(admin_page_url(mock_pages))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved pages as @pages" do
        Admin::Pages.stub!(:new).with({'these' => 'params'}).and_return(mock_pages(:save => false))
        post :create, :pages => {:these => 'params'}
        assigns[:pages].should equal(mock_pages)
      end

      it "re-renders the 'new' template" do
        Admin::Pages.stub!(:new).and_return(mock_pages(:save => false))
        post :create, :pages => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested pages" do
        Admin::Pages.should_receive(:find).with("37").and_return(mock_pages)
        mock_pages.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :pages => {:these => 'params'}
      end

      it "assigns the requested pages as @pages" do
        Admin::Pages.stub!(:find).and_return(mock_pages(:update_attributes => true))
        put :update, :id => "1"
        assigns[:pages].should equal(mock_pages)
      end

      it "redirects to the pages" do
        Admin::Pages.stub!(:find).and_return(mock_pages(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(admin_page_url(mock_pages))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested pages" do
        Admin::Pages.should_receive(:find).with("37").and_return(mock_pages)
        mock_pages.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :pages => {:these => 'params'}
      end

      it "assigns the pages as @pages" do
        Admin::Pages.stub!(:find).and_return(mock_pages(:update_attributes => false))
        put :update, :id => "1"
        assigns[:pages].should equal(mock_pages)
      end

      it "re-renders the 'edit' template" do
        Admin::Pages.stub!(:find).and_return(mock_pages(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested pages" do
      Admin::Pages.should_receive(:find).with("37").and_return(mock_pages)
      mock_pages.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the admin_pages list" do
      Admin::Pages.stub!(:find).and_return(mock_pages(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(admin_pages_url)
    end
  end

end
