require 'bundler'
Bundler.require

require './shiritori'
Encoding.default_external = 'utf-8'
run Sinatra::Application
