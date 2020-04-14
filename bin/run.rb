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
def nick_name(poke)
    puts "Would you like to give #{poke} a nickname? yes or no?"
    answer = gets.chomp
    if answer == "yes"
        puts "What is #{poke}'s nickmane?"
        name = gets.chomp
    else
        name = nil
    end
    name
end

# In this def we are asking the user to pick a starter pokemon (which has to be one of the three to advance in the app)
# then adding that pokemon to the pokemon
def pick_starter
    puts "Pick a starter pokemon between bulbasaur, charmander and squirtle"
    pokemon = gets.chomp
    while pokemon != "bulbasaur" || pokemon != "charmander" || pokemon != "squirtle" do
        puts "Please pick a starter pokemon between bulbasaur, charmander and squirtle"
        pokemon = gets.chomp
    end

    n_name = nick_mane(pokemon)

    if pokemon == "bulbasaur"
        Pokemon.create(nickname: n_name, species: pokemon, type: "grass")
    elsif pokemon == "charmander"
        Pokemon.create(nickname: n_name, species: pokemon, type: "fire")
    elsif pokemon == "squirtle"
        Pokemon.create(nickname: n_name, species: pokemon, type: "water")
    end
    pokemon
end

def run
    user_name = welcome_user
    puts "Welcome to the Elite 3 #{user_name}!!"
    food = get_food
    puts "Awesome! #{food.name} is my fav too"
end

run