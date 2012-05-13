require 'spec_helper'

describe "admin_images/show" do
  before(:each) do
    @image = assign(:image, stub_model(Admin::Image))
  end

  it "renders attributes in <p>" do
    render
  end
end
