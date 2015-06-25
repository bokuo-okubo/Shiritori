module Shiritori
  module Input
    class CLI
      def self.readline
        status = true
        while status
          word = Readline.readline("> ", true)
          status = word.strip.empty?
        end
        self.last(word)
      end

      def self.last(word)
        word.split('').last
      end
    end 
  end
end