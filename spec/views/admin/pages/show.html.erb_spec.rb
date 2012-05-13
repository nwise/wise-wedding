require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')

describe "/admin_pages/show.html.erb" do
  include Admin::PagesHelper
  before(:each) do
    assigns[:pages] = @pages = stub_model(Admin::Pages)
  end

  it "renders attributes in <p>" do
    render
  end
end

