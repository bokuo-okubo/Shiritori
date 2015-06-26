require 'pry'
require 'sinatra'

require 'active_support/dependencies'
ActiveSupport::Dependencies.autoload_paths << './src/'

DATA_PATH = './data'

oauth_token = Network::Networking.get_oauth_token('./data/config.yml')

def running_local
  msg = Shiritori::Core.new(DATA_PATH).run
  topic_id = '14603'
  Network::Networking.post(topic_id, msg)
end

get '/' do
  'hello sinatra'
end

post '/shiritori' do
  body = request.body.read
 
  if body == ''
    status 400
  else
    hash = body.to_json

    msg = Shiritori::Core.new(DATA_PATH).shiritori("ぴよぴよ")
    topic_id = '14603'
    Network::Networking.post(topic_id, msg)
    msg
  end
end