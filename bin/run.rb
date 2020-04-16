require 'rest-client'
require_relative '../config/environment'
require 'pry'

#n_name = nick_mane(user_input) that is if we want to add nick names later
def initialize_chalengers
    Trainer.delete_all
    TrainerPokemon.delete_all
    edgar = Trainer.create(name:"Edgar")
    edgar.pokemons << Pokemon.all.find_by(species: "Blastoise", element: "water")
    jordan = Trainer.create(name:"Jordan")
    jordan.pokemons << Pokemon.all.find_by(species: "Poliwarth", element: "water")
    jordan.pokemons << Pokemon.all.find_by(species: "Arcanine", element: "fire")
    elias =Trainer.create(name:"Elias")
end

def run
    user = welcome_user
    puts "Welcome to the Elite 3 #{user.name}!!\n\n"
    starter = pick_starter
    user.add_pokemon_to_user(starter)
    puts "Awesome! #{starter} is now part of your team!!"
    outcome = nil
    outcome = battle1
    if outcome == "lose" then return "Sorry, you are not strong enough to move on to the next challenger"
    elsif outcome == "tie" then return "You are stuck in a tie, try catching different pokemon elements"
    end
    result_1 = wild_encounter([starter])
    puts "You run into a random #{result_1}. Do you want to catch it?" 
    user.add_pokemon_to_user(result_1) 
    outcome = battle2
    if outcome == "lose" then return
    elsif outcome == "tie" then return 
    result_2 = wild_encounter([starter, result_1])
    puts "You run into a random #{result_2}. Do you want to catch it?" 
    end
    
    #battle3
end

initialize_chalengers
run