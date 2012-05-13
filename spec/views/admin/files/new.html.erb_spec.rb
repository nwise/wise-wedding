require 'spec_helper'

describe "/admin_files/new.html.erb" do
  include Admin::FilesHelper

  before(:each) do
    assigns[:file] = stub_model(Admin::File,
      :new_record? => true
    )
  end

  it "renders new file form" do
    render

    response.should have_tag("form[action=?][method=post]", admin_files_path) do
    end
  end
end
