require 'rest-client'
require_relative '../config/environment'
require 'pry'

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
    puts "Welcome to the Elite 3, #{user.name}!!\n\n"
    sleep(2)
    starter = Pokemon.all.find_by(species: pick_starter)
    user.add_pokemon_to_user(starter.species)
    puts "Great choice! #{starter.species} is now part of your team!!\n\n"
    sleep(2)
    result_1 = wild_encounter([starter.species])
    savage_encouter(result_1) #extra method for neatnesss
    user.add_pokemon_to_user(result_1.species)
       
    outcome = nil
    outcome = battle1
    
    if outcome == "lose" then return "Sorry, you are not strong enough to move on to the next challenger"
    elsif outcome == "tie" then return "You are stuck in a tie, try catching different pokemon elements" end

    starter_fainted_status = TrainerPokemon.find_by(trainer_id: user.id, pokemon_id: starter.id).fainted
    result_1_fainted_status = TrainerPokemon.all.find_by(trainer_id: user.id, pokemon_id: result_1.id).fainted

    if TrainerPokemon.where(trainer_id: user.id, fainted: false).count == 1
        if starter_fainted_status == true
            result_2 = wild_encounter([result_1.species])
            wild_encounter_result(user, result_2)

        elsif result_1_fainted_status == true
            result_2 = wild_encounter([starter.species])
            wild_encounter_result(user, result_2)
        end

    elsif TrainerPokemon.where(trainer_id: user.id, fainted: false).count == 2
        result_2 = wild_encounter([starter.species, result_1.species])
        wild_encounter_result(user, result_2)
    end

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
            wild_encounter_result(user, result_3)

        elsif result_1_fainted_status == true
            result_3 = wild_encounter([starter.species, result_2.species])
            wild_encounter_result(user, result_3)

        elsif result_2_fainted_status == true
            result_3 = wild_encounter([starter.species, result_1.species])
            wild_encounter_result(user, result_3)
        end

    elsif TrainerPokemon.where(trainer_id: user.id, fainted: false).count == 1
        if starter_fainted_status == true && result_1_fainted_status == true
            result_3 = wild_encounter([result_2.species])
                        wild_encounter_result(user, result_3)

        elsif result_1_fainted_status == true && result_2_fainted_status == true
            result_3 = wild_encounter([starter.species])
                        wild_encounter_result(user, result_3)

        elsif result_2_fainted_status == true && starter_fainted_status == true
            result_3 = wild_encounter([result_1.species])
                        wild_encounter_result(user, result_3)
        end
    end
       
    outcome = battle3
    if outcome == "lose" then return "Sorry, you are not strong enough to move on to the next challenger"
    elsif outcome == "tie" then return "You are stuck in a tie, try catching different pokemon elements" end
end

initialize_chalengers
run