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
    elias.pokemons << Pokemon.all.find_by(species: "Magmar", element: "fire")
    elias.pokemons << Pokemon.all.find_by(species: "Blastoise", element: "water")
    elias.pokemons << Pokemon.all.find_by(species: "Victreebel", element: "grass")
end

def run
    user = welcome_user
    puts "Welcome to the Elite 3 #{user.name}!!\n\n"
    starter = Pokemon.all.find_by(species: pick_starter)
    user.add_pokemon_to_user(starter.species)

    puts "Awesome! #{starter.species} is now part of your team!!\n\n"
    
    #helper method (wild encouters)
    result_1 = wild_encounter([starter.species])
    puts "You run into a random #{result_1.species}. He is now part of your team!!!!" 
    user.add_pokemon_to_user(result_1.species)
        
    # user_answer = gets.chomp
    # until user_answer == "Yes" or user_answer == "No"
    #     puts "Please enter 'Yes' or 'No'" 
    #     user_answer = gets.chomp
    # end
    # if user_answer == "Yes" then user.add_pokemon_to_user(result_1.species) end
    #to here
       
    outcome = nil
    outcome = battle1

    # def lose_ti(outcome)
    #     if outcome == "lose" then return "Sorry, you are not strong enough to move on to the next challenger"
    #     elsif outcome == "tie" then return "You are stuck in a tie, try catching different pokemon elements" end
    # end
    starter_fainted_status = TrainerPokemon.find_by(trainer_id: user.id, pokemon_id: starter.id).fainted
    result_1_fainted_status = TrainerPokemon.all.find_by(trainer_id: user.id, pokemon_id: result_1.id).fainted

    if TrainerPokemon.where(trainer_id: user.id, fainted: false).count == 1
        if starter_fainted_status == true
            result_2 = wild_encounter([result_1.species])
            puts "You run into a random #{result_2.species}. He is now part of your team!!!!" 
            user.add_pokemon_to_user(result_2.species)

            # puts "You run into a random #{result_3}. Do you want to catch it?" 
            # user_answer = gets.chomp
            # until user_answer == "Yes" or user_answer == "No"
            # puts "Please enter 'Yes' or 'No'" 
            # user_answer = gets.chomp
            # end
            # if user_answer == "Yes" then user.add_pokemon_to_user(result_3) end

        elsif result_1_fainted_status == true
            result_2 = wild_encounter([starter.species])
            puts "You run into a random #{result_2.species}. He is now part of your team!!!!" 
            user.add_pokemon_to_user(result_2.species)

            # puts "You run into a random #{result_3}. Do you want to catch it?" 
            # user_answer = gets.chomp
            # until user_answer == "Yes" or user_answer == "No"
            # puts "Please enter 'Yes' or 'No'" 
            # user_answer = gets.chomp
            # end
            # if user_answer == "Yes" then user.add_pokemon_to_user(result_3) end
        end
    elsif TrainerPokemon.where(trainer_id: user.id, fainted: false).count == 2
        result_2 = wild_encounter([starter.species, result_1.species])
        puts "You run into a random #{result_2.species}. He is now part of your team!!!!" 
        user.add_pokemon_to_user(result_2.species)
    end

    #helper method (wild encouters)
    # result_2 = wild_encounter([starter.species, result_1.species])
    # puts "You run into a random #{result_2.species}. He is now part of your team!!!!" 
    # user.add_pokemon_to_user(result_2.species)
    
    # result_2_fainted_status = TrainerPokemon.all.find_by(trainer_id: user.id, pokemon_id: result_2.id).fainted

    # puts "You run into a random #{result_2.species}. Do you want to catch it?" 
    # user_answer = gets.chomp
    # until user_answer == "Yes" or user_answer == "No"
    #     puts "Please enter 'Yes' or 'No'" 
    #     user_answer = gets.chomp
    # end
    # if user_answer == "Yes" then user.add_pokemon_to_user(result_2.species) end
    #ends method

    outcome = battle2
    #helper method (outcome)
    if outcome == "lose" then return "Sorry, you are not strong enough to move on to the next challenger"
    elsif outcome == "tie" then return "You are stuck in a tie, try catching different pokemon elements" end
    #to here
    starter_fainted_status = TrainerPokemon.find_by(trainer_id: user.id, pokemon_id: starter.id).fainted
    result_1_fainted_status = TrainerPokemon.all.find_by(trainer_id: user.id, pokemon_id: result_1.id).fainted
    result_2_fainted_status = TrainerPokemon.all.find_by(trainer_id: user.id, pokemon_id: result_2.id).fainted

    if TrainerPokemon.where(trainer_id: user.id, fainted: false).count == 2
        if starter_fainted_status == true
            result_3 = wild_encounter([result_1.species, result_2.species])
            puts "You run into a random #{result_3.species}. He is now part of your team!!!!" 
            user.add_pokemon_to_user(result_3.species)

        elsif result_1_fainted_status == true
            result_3 = wild_encounter([starter.species, result_2.species])
            puts "You run into a random #{result_3.species}. He is now part of your team!!!!" 
            user.add_pokemon_to_user(result_3.species)

        elsif result_2_fainted_status == true
            result_3 = wild_encounter([starter.species, result_1.species])
            puts "You run into a random #{result_3.species}. He is now part of your team!!!!" 
            user.add_pokemon_to_user(result_3.species)
        end

    elsif TrainerPokemon.where(trainer_id: user.id, fainted: false).count == 1
        if starter_fainted_status == true && result_1_fainted_status == true
            result_3 = wild_encounter([result_2.species])
            puts "You run into a random #{result_3.species}. He is now part of your team!!!!" 
            user.add_pokemon_to_user(result_3.species)

        elsif result_1_fainted_status == true && result_2_fainted_status == true
            result_3 = wild_encounter([starter.species])
            puts "You run into a random #{result_3.species}. He is now part of your team!!!!" 
            user.add_pokemon_to_user(result_3.species)

        elsif result_2_fainted_status == true && starter_fainted_status == true
            result_3 = wild_encounter([result_1.species])
            puts "You run into a random #{result_3.species}. He is now part of your team!!!!" 
            user.add_pokemon_to_user(result_3.species)

            # puts "You run into a random #{result_3}. Do you want to catch it?" 
            # user_answer = gets.chomp
            # until user_answer == "Yes" or user_answer == "No"
            # puts "Please enter 'Yes' or 'No'" 
            # user_answer = gets.chomp
            # end
            # if user_answer == "Yes" then user.add_pokemon_to_user(result_3) end
        end
    end
       
    #battle3
    outcome = battle3
    #helper method (outcome)
    if outcome == "lose" then return "Sorry, you are not strong enough to move on to the next challenger"
    elsif outcome == "tie" then return "You are stuck in a tie, try catching different pokemon elements" end
end

    

initialize_chalengers
run