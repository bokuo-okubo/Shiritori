module Shiritori
  class Core

    def initialize
      data_path = './dictionary.yml'
      @dictionary = Shiritori::Dictionary.new(data_path)
    end

    def run
      last_char = Shiritori::CLI.readline

      p @dictionary.get_word(last_char)
    end
  end
end