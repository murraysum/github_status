module GithubStatus
  class API
    API_URL = "https://status.github.com/api.json"

    STATUS_URL = "https://status.github.com/api/status.json" 

    LAST_MESSAGE_URL = "https://status.github.com/api/last-message.json" 

    MESSAGES_URL = "https://status.github.com/api/messages.json" 

    def self.api
      get(API_URL)
    end

    def self.current_status
      get(STATUS_URL)
    end

    def self.last_message
      get(LAST_MESSAGE_URL)
    end

    def self.messages
      get(MESSAGES_URL)
    end

    private

    def self.get(uri)
      uri = prepare_uri(uri)
      
      response = Net::HTTP.start(uri.host, use_ssl: true) do |http|
        request = Net::HTTP::Get.new(uri.request_uri)
        http.request(request)
      end

      prepare_response(response)
    end

    def self.prepare_uri(uri)
      URI.parse(uri)
    end

    def self.prepare_response(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end