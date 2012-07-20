require 'spec_helper'

describe "rsvps/index" do
  before(:each) do
    assign(:rsvps, [
      stub_model(Rsvp),
      stub_model(Rsvp)
    ])
  end

  it "renders a list of rsvps" do
    render
  end
end
