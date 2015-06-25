module Shiritori
  class CLI
    class << self
      def readline
        status = true
        while status
          word = Readline.readline("> ", true)
          status = word.strip.empty?
        end
        Shiritori::CLI.last(word)
      end

      def last(word)
        word.split('').last
      end
    end 
  end
end