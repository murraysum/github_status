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

    def self.current
      response = GithubStatus::API.current_status
      response[:created_on] = response[:last_updated]
      response[:body] = ''
      new(response)
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