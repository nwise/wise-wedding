require 'spec_helper'

describe "/admin_files/show.html.erb" do
  include Admin::FilesHelper
  before(:each) do
    assigns[:file] = @file = stub_model(Admin::File)
  end

  it "renders attributes in <p>" do
    render
  end
end
