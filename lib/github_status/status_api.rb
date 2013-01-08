module Github
  class StatusAPI

    def self.api
      get("https://status.github.com/api.json")
    end

    def self.current_status
      get("https://status.github.com/api/status.json")
    end

    def self.last_message
      get("https://status.github.com/api/last-message.json")
    end

    def self.messages
      get("https://status.github.com/api/messages.json")
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