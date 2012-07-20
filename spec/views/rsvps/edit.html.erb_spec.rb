require 'spec_helper'

describe "rsvps/edit" do
  before(:each) do
    @rsvp = assign(:rsvp, stub_model(Rsvp))
  end

  it "renders the edit rsvp form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => rsvps_path(@rsvp), :method => "post" do
    end
  end
end
