#encoding: utf-8
require 'pry'
require 'pry-byebug'
require 'sinatra'
require 'json'
require 'time'
require 'parallel'

require 'active_support/dependencies'
ActiveSupport::Dependencies.autoload_paths << './src/'

DATA_PATH = './data'

oauth_token = Network::Networking.get_oauth_token('./data/config.yml')



def clocking
  msg = Time.now.to_s
  topic_id = '14603'
  Network::Networking.post(topic_id, msg)
end

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
    clocking
    logger.info hash = JSON.parse(body)
    ans = hash["post"]["message"]
    account_id = hash["post"]["account"]["id"]

    msg_ary = Shiritori::Core.new(DATA_PATH).shiritori(ans)
    { "message" => msg_ary.shuffle.first, "replyTo" => account_id }.to_json # HTTP response
  end
end
