module GithubStatus
  class Status

    GOOD = "good"
    MAJOR = "major"
    MINOR = "minor"

    attr_reader :status, :message, :created_on

    def initialize(options)
      @status = options[:status]
      @message = options[:body]
      @created_on = DateTime.parse(options[:created_on])
    end

    def self.last_message 
      new(GithubStatus::API.last_message)
    end

    def self.messages
      GithubStatus::API.messages.collect { |response| new(response) }
    end
    
    def good?
      status == GOOD
    end

    def major?
      status == MAJOR
    end
    
    def minor?
      status == MINOR
    end
  end
end