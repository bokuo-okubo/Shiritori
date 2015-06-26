require 'net/http'

module Network
  class HTTP

    def self.build_sender
      http = Net::HTTP.new('typetalk.in', 443)
      http.use_ssl = true
      http
    end
  end
end
