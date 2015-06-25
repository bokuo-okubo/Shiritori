require 'pry'
require 'active_support/dependencies'
ActiveSupport::Dependencies.autoload_paths << './src/'

DATA_PATH = './data'
Shiritori::Core.new(DATA_PATH).run