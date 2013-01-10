require 'spec_helper'

describe "#{Github::Status} VERSION" do
  it "should be version 0.0.1" do
    Github::VERSION.should == "0.0.1"
  end
end