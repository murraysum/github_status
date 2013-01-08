module Github
  class Status

    GOOD = "good"
    MAJOR = "major"
    MINOR = "minor"

    attr_reader :status, :message, :created_on

    def initialize(options)
      @status = options[:status]
      @message = options[:body]
      @created_on = options[:created_on]
    end

    def self.last_message 
      new(Github::StatusAPI.last_message)
    end

    def self.messages
      Github::StatusAPI.messages.collect { |response| new(response) }
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