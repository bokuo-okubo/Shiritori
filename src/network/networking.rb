require 'yaml'
require 'net/http'

module Network
  class Networking
    def self.get_oauth_token(path)
      map = self.load_config(path)
      id = map[:client_id]
      secret = map[:client_secret]

      oauth_client = Network::Oauth.new(id, secret)
      @access_token ||= oauth_client.get_oauth_token
    end

    def self.load_config(config_path)
      yml_data = YAML.load_file(config_path)
      { :client_id => yml_data['typetalk_config']['client_id'],
        :client_secret => yml_data['typetalk_config']['client_secret'] }
    end

    def self.post(topic_id, msg)
      # post a message
      req = Net::HTTP::Post.new("/api/v1/topics/#{topic_id}")
      req['Authorization'] = "Bearer #{ @access_token }"
      req.set_form_data({:message=>msg})
      Network::HTTP.build_sender.request(req)
    end
  end
end