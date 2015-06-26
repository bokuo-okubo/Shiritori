require 'clockwork'
require 'time'

module Network
  module Clock 
    include Clockwork
    
    handler do |job|
      puts "Running #{job}"
  
      topic_id = '14603'
      msg = Time.now.to_s
      Network::Networking.post(topic_id, msg) ## messaging protocol
    end
  
    # handler receives the time when job is prepared to run in the 2nd argument
    # handler do |job, time|
    #   puts "Running #{job}, at #{time}"
    # end
  
    every(20.seconds, 'less.frequent.job')
  end
end