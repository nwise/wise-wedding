require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')

describe "/admin_pages/index.html.erb" do
  include Admin::PagesHelper
  
  before(:each) do
    assigns[:admin_pages] = [
      stub_model(Admin::Pages),
      stub_model(Admin::Pages)
    ]
  end

  it "renders a list of admin_pages" do
    render
  end
end

