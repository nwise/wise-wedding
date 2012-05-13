require 'spec_helper'

describe Admin::File do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    Admin::File.create!(@valid_attributes)
  end
end
