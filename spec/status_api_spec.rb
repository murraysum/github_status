require 'spec_helper'

describe Github::StatusAPI do
  describe "#api" do
    before do
      @expected_response = {
        status_url: "https://status.github.com/api/status.json",
        messages_url: "https://status.github.com/api/messages.json",
        last_message_url: "https://status.github.com/api/last-message.json"
      }

      @stub_request = stub_request(:get, "https://status.github.com/api.json")
      @stub_request.to_return(body: JSON.generate(@expected_response))

      @actual_response = Github::StatusAPI.api
    end

    describe "request" do  
      it "should have been requested" do
        @stub_request.should have_been_requested
      end

      it "should have requested api.json" do
        @stub_request.should have_requested(:get, "https://status.github.com/api.json")
      end
    end

    describe "response" do
      it "should have responded with a status url" do
        @actual_response[:status_url].should == @expected_response[:status_url] 
      end

      it "should have responded with a messages url" do
        @actual_response[:messages_url].should == @expected_response[:messages_url] 
      end

      it "should have responded with a last message url" do
        @actual_response[:last_message_url].should == @expected_response[:last_message_url] 
      end
    end
  end

  describe "#last_message" do
    before do
      @expected_response = {
        status: "good",
        body: "good status message",
        created_on: Time.now.to_s
      }

      @stub_request = stub_request(:get, "https://status.github.com/api/last-message.json")
      @stub_request.to_return(body: JSON.generate(@expected_response))

      @actual_response = Github::StatusAPI.last_message
    end

    describe "request" do  
      it "should have been requested" do
        @stub_request.should have_been_requested
      end

      it "should have requested last-message.json" do
        @stub_request.should have_requested(:get, "https://status.github.com/api/last-message.json")
      end
    end

    describe "response" do
      it "should have responded with a status" do
        @actual_response[:status].should == @expected_response[:status] 
      end

      it "should have responded with a body" do
        @actual_response[:body].should == @expected_response[:body] 
      end

      it "should have responded with a created_on" do
        @actual_response[:created_on].should == @expected_response[:created_on] 
      end
    end
  end

  describe "#messages" do
    before do
      @status_options_1 = {
        status: "major",
        body: "some major status message",
        created_on: Time.now.to_s
      }
      @status_options_2 = {
        status: "minor",
        body: "some minor status message",
        created_on: Time.now.to_s
      }
      @expected_response = [@status_options_1, @status_options_2]

      @stub_request = stub_request(:get, "https://status.github.com/api/messages.json")
      @stub_request.to_return(body: JSON.generate(@expected_response))

      @actual_response = Github::StatusAPI.messages
    end

    describe "request" do
      it "should have been requested" do
        @stub_request.should have_been_requested
      end

      it "should have requested messages.json" do
        @stub_request.should have_requested(:get, "https://status.github.com/api/messages.json")
      end
    end

    describe "response" do
      it "should respond with a list of messages" do
        @actual_response.should == @expected_response
      end
    end
  end
end

