require 'spec_helper'

describe "/admin_files/edit.html.erb" do
  include Admin::FilesHelper

  before(:each) do
    assigns[:file] = @file = stub_model(Admin::File,
      :new_record? => false
    )
  end

  it "renders the edit file form" do
    render

    response.should have_tag("form[action=#{file_path(@file)}][method=post]") do
    end
  end
end
