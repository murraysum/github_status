require 'spec_helper'

describe GithubStatus::Status do
  describe 'status constants' do
    it 'should have good status' do
      GithubStatus::Status::GOOD.should == "good" 
    end

    it 'should have major status' do
      GithubStatus::Status::MAJOR.should == "major" 
    end

    it 'should have minor status' do
      GithubStatus::Status::MINOR.should == "minor" 
    end
  end

  describe "initialize" do
    before do
      @options = {
        status: "good",
        body: "some status message",
        created_on: DateTime.now.to_s
      }
      @status_item = GithubStatus::Status.new(@options)
    end

    it 'should initialise the status' do
      @status_item.status.should == @options[:status]
    end

    it 'should initialise the message' do
      @status_item.message.should == @options[:body]
    end

    it 'should initialise the created on' do
      @status_item.created_on.to_s.should == @options[:created_on]
    end
  end

  describe ".good?" do
    before do
      @options = {
        status: "good",
        body: "some status message",
        created_on: DateTime.now.to_s
      }
      @status_item = GithubStatus::Status.new(@options)
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
        created_on: DateTime.now.to_s
      }
      @status_item = GithubStatus::Status.new(@options)
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
        created_on: DateTime.now.to_s
      }
      @status_item = GithubStatus::Status.new(@options)
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

  describe "#current" do
    before do
      @options = {
        status: "major",
        last_updated: DateTime.now.to_s
      }
      GithubStatus::API.stub(:current_status) { @options }
      @status_item = GithubStatus::Status.current
    end

    it 'should initialise the status' do
      @status_item.status.should == @options[:status]
    end

    it 'should initialise an empty message' do
      @status_item.message.should == ''
    end

    it 'should initialise the created on from the last updated' do
      @status_item.created_on.to_s.should == @options[:last_updated]
    end
  end

  describe "#last_message" do
    before do
      @options = {
        status: "major",
        body: "some status message",
        created_on: DateTime.now.to_s
      }
      GithubStatus::API.stub(:last_message) { @options }
      @status_item = GithubStatus::Status.last_message
    end
    
    it 'should initialise the status' do
      @status_item.status.should == @options[:status]
    end

    it 'should initialise the message' do
      @status_item.message.should == @options[:body]
    end

    it 'should initialise the created on' do
      @status_item.created_on.to_s.should == @options[:created_on]
    end
  end

  describe "#messages" do
    before do
      @status_options_1 = {
        status: "major",
        body: "some major status message",
        created_on: DateTime.now.to_s
      }
      @status_options_2 = {
        status: "minor",
        body: "some minor status message",
        created_on: DateTime.now.to_s
      }
      @options = [@status_options_1, @status_options_2] 
      GithubStatus::API.stub(:messages) { @options }
      @status_items = GithubStatus::Status.messages
    end

    it "should contain both status messages" do
      @status_items.should have(2).items
    end

    describe "initialize the first status" do
      it 'should initialise the status' do
        @status_items[0].status.should == @status_options_1[:status]
      end

      it 'should initialise the message' do
        @status_items[0].message.should == @status_options_1[:body]
      end

      it 'should initialise the created on' do
        @status_items[0].created_on.to_s.should == @status_options_1[:created_on]
      end
    end 

    describe "initialize the second status" do
      it 'should initialise the status' do
        @status_items[1].status.should == @status_options_2[:status]
      end

      it 'should initialise the message' do
        @status_items[1].message.should == @status_options_2[:body]
      end

      it 'should initialise the created on' do
        @status_items[1].created_on.to_s.should == @status_options_2[:created_on]
      end
    end 
  end
end