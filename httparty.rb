require 'httparty'

response = HTTParty.get('http://giantbomb.com')

puts response.headers.inspect
