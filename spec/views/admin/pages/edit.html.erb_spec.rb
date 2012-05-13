require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')

describe "/admin_pages/edit.html.erb" do
  include Admin::PagesHelper
  
  before(:each) do
    assigns[:pages] = @pages = stub_model(Admin::Pages,
      :new_record? => false
    )
  end

  it "renders the edit pages form" do
    render
    
    response.should have_tag("form[action=#{pages_path(@pages)}][method=post]") do
    end
  end
end


