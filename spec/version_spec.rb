require 'spec_helper'

describe "#{GithubStatus::Status} version information" do
  it "should be version 0.0.2" do
    GithubStatus::VERSION.should == "0.0.2"
  end

  it "should have authors" do
    GithubStatus::AUTHORS.should_not be_empty
  end

  it "should have email addresses" do
    GithubStatus::EMAIL.should_not be_empty
  end

  it "should have a summary" do
    GithubStatus::SUMMARY.should == "Github Status API"
  end

  it "should have a homepage" do
    GithubStatus::HOMEPAGE.should == "https://github.com/murraysum/github_status"
  end

  it "should have a description" do
    GithubStatus::DESCRIPTION.should_not be_empty
  end
end