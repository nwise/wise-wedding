require 'spec_helper'

describe "/admin_files/index.html.erb" do
  include Admin::FilesHelper

  before(:each) do
    assigns[:admin_files] = [
      stub_model(Admin::File),
      stub_model(Admin::File)
    ]
  end

  it "renders a list of admin_files" do
    render
  end
end
