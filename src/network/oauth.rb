require 'json'

module Network
  class Oauth
    def initialize(id, secret)
      @client_id = id
      @client_secret = secret
    end

    def get_oauth_token
      http = Network::HTTP.build_sender
      res = http.post('/oauth2/access_token',
        "client_id=#{ @client_id }&client_secret=#{ @client_secret }&grant_type=client_credentials&scope=topic.post")
      json = JSON.parse(res.body)
      @access_token ||= json['access_token']
    end
  end
end