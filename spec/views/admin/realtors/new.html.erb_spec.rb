require 'spec_helper'

describe "/admin_realtors/new.html.erb" do
  include Admin::RealtorsHelper

  before(:each) do
    assigns[:realtor] = stub_model(Admin::Realtor,
      :new_record? => true
    )
  end

  it "renders new realtor form" do
    render

    response.should have_tag("form[action=?][method=post]", admin_realtors_path) do
    end
  end
end
