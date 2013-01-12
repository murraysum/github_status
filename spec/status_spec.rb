require 'spec_helper'

describe Github::Status do
  describe 'status constants' do
    it 'should have good status' do
      Github::Status::GOOD.should == "good" 
    end

    it 'should have major status' do
      Github::Status::MAJOR.should == "major" 
    end

    it 'should have minor status' do
      Github::Status::MINOR.should == "minor" 
    end
  end

  describe "initialize" do
    before do
      @options = {
        status: "good",
        body: "some status message",
        created_on: Time.now
      }
      @status_item = Github::Status.new(@options)
    end

    it 'should initialise the status' do
      @status_item.status.should == @options[:status]
    end

    it 'should initialise the message' do
      @status_item.message.should == @options[:body]
    end

    it 'should initialise the created on' do
      @status_item.created_on.should == @options[:created_on]
    end
  end

  describe ".good?" do
    before do
      @options = {
        status: "good",
        body: "some status message",
        created_on: Time.now
      }
      @status_item = Github::Status.new(@options)
    end

    it 'should identify as good' do
      @status_item.good?.should be_true
    end

    it 'should not identify as major' do
      @status_item.major?.should be_false
    end

    it 'should not identify as minor' do
      @status_item.minor?.should be_false
    end
  end

  describe ".major?" do
    before do
      @options = {
        status: "major",
        body: "some status message",
        created_on: Time.now
      }
      @status_item = Github::Status.new(@options)
    end

    it 'should not identify as good' do
      @status_item.good?.should be_false
    end

    it 'should identify as major' do
      @status_item.major?.should be_true
    end

    it 'should not identify as minor' do
      @status_item.minor?.should be_false
    end
  end

  describe ".minor?" do
    before do
      @options = {
        status: "minor",
        body: "some status message",
        created_on: Time.now
      }
      @status_item = Github::Status.new(@options)
    end

    it 'should not identify as good' do
      @status_item.good?.should be_false
    end

    it 'should not identify as major' do
      @status_item.major?.should be_false 
    end

    it 'should identify as minor' do
      @status_item.minor?.should be_true
    end
  end

  describe "#last_message" do
    before do
      @options = {
        status: "major",
        body: "some status message",
        created_on: Time.now
      }
      Github::StatusAPI.stub(:last_message) { @options }
      @status_item = Github::Status.last_message
    end
    
    it 'should initialise the status' do
      @status_item.status.should == @options[:status]
    end

    it 'should initialise the message' do
      @status_item.message.should == @options[:body]
    end

    it 'should initialise the created on' do
      @status_item.created_on.should == @options[:created_on]
    end
  end
end