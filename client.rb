#
#
require 'net/http'
require 'uri'
require 'open-uri'

def save_data(data, host)
  uri = URI.parse("#{host}/save")

  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Post.new(uri.request_uri)
  request.body = data
  http.request(request)
end

def read_data(host)
  open("#{host}/read").read
end
