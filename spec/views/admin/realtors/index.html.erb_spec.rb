require 'spec_helper'

describe "/admin_realtors/index.html.erb" do
  include Admin::RealtorsHelper

  before(:each) do
    assigns[:admin_realtors] = [
      stub_model(Admin::Realtor),
      stub_model(Admin::Realtor)
    ]
  end

  it "renders a list of admin_realtors" do
    render
  end
end
