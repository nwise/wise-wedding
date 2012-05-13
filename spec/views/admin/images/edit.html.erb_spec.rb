require 'spec_helper'

describe "admin_images/edit" do
  before(:each) do
    @image = assign(:image, stub_model(Admin::Image))
  end

  it "renders the edit image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_images_path(@image), :method => "post" do
    end
  end
end
