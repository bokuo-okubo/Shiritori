require 'yaml'

module Network
  class Networking
    def self.get_oauth_token(path)
      map = self.load_config(path)
      id = map[:client_id]
      secret = map[:client_secret]

      oauth_client = Network::OAuth.new(id, secret)
      oauth_client.get_oauth_token
    end

    def self.load_config(config_path)
      yml_data = YAML.load_file(config_path)
      { :client_id => yml_data['typetalk_config']['client_id'],
        :client_secret => yml_data['typetalk_config']['client_secret'] }
    end
  end
end