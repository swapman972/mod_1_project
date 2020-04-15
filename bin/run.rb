require 'rest-client'
require_relative '../config/environment'
require_relative '../app/models'
require 'pry'

# In this def we will ask the user for his name and add him to the trainer table
def welcome_user
    puts "Hello new trainer, what is your name?"
    user_name = gets.chomp
    Trainer.create(name: user_name)
    user_name
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
    puts "Pick a starter pokemon_name between Venusaur, Charizard and Blastoise"
    pokemon_name = gets.chomp
    while pokemon_name != "Venusaur" || pokemon_name != "Charizard" || pokemon_name != "Blatoise" do
        puts "Please pick a starter pokemon_name between Venusaur, Charizard and Blastoise"
        pokemon_name = gets.chomp
    end

    #n_name = nick_mane(pokemon_name)

    if pokemon_name == "Venusaur"
        self.pokemon << venusaur
    elsif pokemon_name == "Charizard"
        self.pokemon << charizard
    elsif pokemon_name == "Blatoise"
        self.pokemon << blatoise    
    end
    pokemon_name
end

def run
    user_name = welcome_user
    puts "Welcome to the Elite 3 #{user_name}!!"
    starter = pick_starter
    puts "Awesome! #{starter} is now part of your team!!"
end

run