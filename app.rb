require 'sinatra'
require 'json'

file = ARGV[0]

get '/' do
  erb :index
end

get '/content' do
  content_type :json
  h = {
    'content' => `tail -n 50 #{file}`
  }
  h.to_json
end
