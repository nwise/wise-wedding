require 'spec_helper'

describe "rsvps/new" do
  before(:each) do
    assign(:rsvp, stub_model(Rsvp).as_new_record)
  end

  it "renders new rsvp form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => rsvps_path, :method => "post" do
    end
  end
end
