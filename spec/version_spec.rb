require 'spec_helper'

describe "#{Github::Status} version information" do
  it "should be version 0.0.1" do
    Github::VERSION.should == "0.0.1"
  end

  it "should have authors" do
    Github::AUTHORS.should_not be_empty
  end

  it "should have email addresses" do
    Github::EMAIL.should_not be_empty
  end

  it "should have a summary" do
    Github::SUMMARY.should == "Github Status API"
  end

  it "should have a homepage" do
    Github::HOMEPAGE.should == "https://github.com/murraysum/github_status"
  end

  it "should have a description" do
    Github::DESCRIPTION.should_not be_empty
  end
end