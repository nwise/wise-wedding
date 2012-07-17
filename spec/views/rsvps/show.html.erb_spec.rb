require 'spec_helper'

describe "rsvps/show" do
  before(:each) do
    @rsvp = assign(:rsvp, stub_model(Rsvp))
  end

  it "renders attributes in <p>" do
    render
  end
end
