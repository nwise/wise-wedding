require 'spec_helper'

describe "/admin_realtors/show.html.erb" do
  include Admin::RealtorsHelper
  before(:each) do
    assigns[:realtor] = @realtor = stub_model(Admin::Realtor)
  end

  it "renders attributes in <p>" do
    render
  end
end
