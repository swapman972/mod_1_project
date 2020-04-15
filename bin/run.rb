require 'rest-client'
require_relative '../config/environment'
#require_relative '../app/models'
require 'pry'

# In this def we will ask the user for his name and add him to the trainer table
def welcome_user
    puts "Hello new trainer, what is your name?"
    user_name = gets.chomp
    user = Trainer.create(name: user_name)
end

# This def is a helper method to request a nick name
#def nick_name(poke)
#    puts "Would you like to give #{poke} a nickname? yes or no?"
#    answer = gets.chomp
#    if answer == "yes"
#        puts "What is #{poke}'s nickmane?"
#        name = gets.chomp
#    else
#        name = "#{poke}"
#    end
#    name
#end

# In this def we are asking the user to pick a starter pokemon (which has to be one of the three to advance in the app)
# then adding that pokemon to the pokemon table
def pick_starter
    puts "Pick a starter pokemon between Venusaur, Charizard and Blastoise"
    user_input = gets.chomp
    until (user_input == "Venusaur" or user_input == "Charizard" or user_input == "Blastoise")
        puts "Please pick a starter pokemon between Venusaur, Charizard and Blastoise"
        user_input = gets.chomp
    end
    user_input
end
    #n_name = nick_mane(user_input) that is if we want to add nick names later

def run
    user = welcome_user
    puts "Welcome to the Elite 3 #{user.name}!!"
    starter = pick_starter
    user.adding_starter_to_user(starter)
    puts "Awesome! #{starter} is now part of your team!!"
end

run