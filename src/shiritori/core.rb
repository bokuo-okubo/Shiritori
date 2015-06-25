module Shiritori
  class Core

    def initialize(data_path)
      yml_path = data_path + "/dictionary.yml"
      @dictionary = Shiritori::Dictionary.new(yml_path)
    end

    def run
      last_char = Shiritori::Input::CLI.readline

      p @dictionary.get_word(last_char) # p method is temporary
    end
  end
end