require 'net/http'
require 'sinatra'

get '/' do
   resp = Net::HTTP.get_response(URI.parse(ENV['NEO4J_URL'] + "/dsr/connections/I"))
   "I => " + resp.body
end
