require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')

describe "/admin_pages/new.html.erb" do
  include Admin::PagesHelper
  
  before(:each) do
    assigns[:pages] = stub_model(Admin::Pages,
      :new_record? => true
    )
  end

  it "renders new pages form" do
    render
    
    response.should have_tag("form[action=?][method=post]", admin_pages_path) do
    end
  end
end


