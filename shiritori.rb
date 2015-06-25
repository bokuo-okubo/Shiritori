require 'pry'
require 'active_support/dependencies'
ActiveSupport::Dependencies.autoload_paths << './src/'

DATA_PATH = './data'

oauth_token = Network::Networking.get_oauth_token('./data/config.yml')

msg = Shiritori::Core.new(DATA_PATH).run
topic_id = '14603'
Network::Networking.post(topic_id, msg)