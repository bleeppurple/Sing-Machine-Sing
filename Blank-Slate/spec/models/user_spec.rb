require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :login => false
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end
end
