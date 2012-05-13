require 'spec_helper'

describe Admin::Realtor do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    Admin::Realtor.create!(@valid_attributes)
  end
end
