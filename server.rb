require 'sinatra'
require 'open-uri'
require 'json'

Rack::Utils.key_space_limit = 100000000

system("ngrok http #{9494} > /dev/null &", out: $stdout, err: :out)

tries = 0

set :port, 9494

begin
  ngrok_tunnels = JSON.parse(URI.open("http://127.0.0.1:4040/api/tunnels").read)
  puts ngrok_tunnels['tunnels'].find {|t| t['proto'] == 'http' }['public_url']
rescue
  tries += 1
  sleep(1)
  retry if tries < 5
  raise StandardError, "Can't connect to ngrok"
end


post '/save' do
  File.open("./data", 'w') do |f|
    f.write(request.body.read)
  end
  "success"
end

get '/read' do
  File.read("./data")
end
