require 'net/http'

module Network
  class HTTP

    def self.build_sender
      http = Net::HTTP.new('typetalk.in', 443)
      http.use_ssl = true
      http
    end
  end
end



# # post a message
# req = Net::HTTP::Post.new("/api/v1/topics/#{topic_id}")
# req['Authorization'] = "Bearer #{access_token}"
# req.set_form_data({:message=>msg})
# http.request(req)