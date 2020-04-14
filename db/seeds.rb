require 'rest-client'
require 'pry'

response = RestClient.get('https://pokeapi.co/api/v2/type/fire')
fire_data = JSON.parse(response)
# What should I do now that I have my data
fire_data.each do |pokemon|
    binding.pry
    ""
end