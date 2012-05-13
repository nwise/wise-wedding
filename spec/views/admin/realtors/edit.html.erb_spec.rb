require 'spec_helper'

describe "/admin_realtors/edit.html.erb" do
  include Admin::RealtorsHelper

  before(:each) do
    assigns[:realtor] = @realtor = stub_model(Admin::Realtor,
      :new_record? => false
    )
  end

  it "renders the edit realtor form" do
    render

    response.should have_tag("form[action=#{realtor_path(@realtor)}][method=post]") do
    end
  end
end
