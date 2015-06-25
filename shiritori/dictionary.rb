require 'yaml'

module Shiritori
  class Dictionary

    def initialize(data_path)
      @dictionary = YAML.load_file( data_path ) 
    end

    def get_word(ja_char)
      @dictionary[ja_char]
    end
  end
end
