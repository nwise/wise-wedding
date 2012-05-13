require 'spec_helper'

describe "admin_images/index" do
  before(:each) do
    assign(:admin_images, [
      stub_model(Admin::Image),
      stub_model(Admin::Image)
    ])
  end

  it "renders a list of admin_images" do
    render
  end
end
