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
    # jordan.pokemons << Pokemon.all.find_by(species: "Poliwarth", element: "water") Just so the second challenger only has fire type
    jordan.pokemons << Pokemon.all.find_by(species: "Ninetales", element: "fire")
    jordan.pokemons << Pokemon.all.find_by(species: "Arcanine", element: "fire")
    elias =Trainer.create(name:"Elias")
end

def run
    user = welcome_user
    puts "Welcome to the Elite 3 #{user.name}!!\n\n"
    starter = pick_starter
    user.add_pokemon_to_user(starter)
    puts "Awesome! #{starter} is now part of your team!!\n\n"
    
    #helper method (wild encouters)
    result_1 = wild_encounter([starter])
    puts "You run into a random #{result_1}. Do you want to catch it?" 
    user_answer = gets.chomp
    until user_answer == "Yes" or user_answer == "No"
        puts "Please enter 'Yes' or 'No'" 
        user_answer = gets.chomp
    end
    if user_answer == "Yes" then user.add_pokemon_to_user(result_1) end
    #to here
       
    outcome = nil
    outcome = battle1
    #helper method (outcome)
    if outcome == "lose" then return "Sorry, you are not strong enough to move on to the next challenger"
    elsif outcome == "tie" then return "You are stuck in a tie, try catching different pokemon elements" end
    #to here

    #helper method (wild encouters)
    result_2 = wild_encounter([starter, result_1])
    puts "You run into a random #{result_2}. Do you want to catch it?" 
    user_answer = gets.chomp
    until user_answer == "Yes" or user_answer == "No"
        puts "Please enter 'Yes' or 'No'" 
        user_answer = gets.chomp
    end
    if user_answer == "Yes" then user.add_pokemon_to_user(result_2) end
    #ends method

    outcome = battle2
    #helper method (outcome)
    if outcome == "lose" then return "Sorry, you are not strong enough to move on to the next challenger"
    elsif outcome == "tie" then return "You are stuck in a tie, try catching different pokemon elements" end
    #to here

    #helper method (wild encouters)
    if user.pokemons.count < 3
        result_3 = wild_encounter([starter=nil, result_1=nil, result_2=nil])
        puts "You run into a random #{result_3}. Do you want to catch it?" 
        user_answer = gets.chomp
        until user_answer == "Yes" or user_answer == "No"
            puts "Please enter 'Yes' or 'No'" 
            user_answer = gets.chomp
        end
        if user_answer == "Yes" then user.add_pokemon_to_user(result_3) end
    end

    #battle3
end
    

initialize_chalengers
run