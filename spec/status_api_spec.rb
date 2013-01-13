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
end

