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
    puts "Pick a starter pokemon, you can choose between Venusaur, Charizard and Blastoise"
    user_input = gets.chomp
    until (user_input == "Venusaur" or user_input == "Charizard" or user_input == "Blastoise")
        puts "Please pick a starter pokemon between Venusaur, Charizard and Blastoise"
        user_input = gets.chomp
    end
    user_input
end

def winning_condition
    
end

def battle1
    battling = Battle.new
    win = 0
    lost = 0
    tie = 0
    until win == 1 or lost == 2 or tie == 2
        battling.choose_your_pokemon	
        battling.computer_pokemon(1)
        outcome = battling.run_game     
        if outcome == "win" then win += 1 
        elsif outcome == "lose" then lost += 1
        elsif outcome == "tie" then tie += 1
        end
    end
    if win == 1 then puts "Congrats, you can move on to the next challenger\n\n"
    end
   outcome        
end

def wild_encounter(pokemon_strings)
    pokemon_array = Pokemon.where(species: pokemon_strings)
    element_set = Set[]
    for pokemon in pokemon_array do
        element_set.add(pokemon.element)
    end
    valid_pokemon = Pokemon.where.not(element: element_set)
    selected_pokemon = valid_pokemon[rand(valid_pokemon.size)].species 
    # binding.pry
    # selected_pokemon
end

# def wild_encounters
#     starter = pick_starter
#     result_1 = wild_encounter([starter])
#     result_2 = wild_encounter([starter, result1])
# end

def battle2
    battling = Battle.new
    win = 0
    lost = 0
    tie = 0
    until win == 2 or lost == 2 or tie == 2
        #gotta check if user has no more pokemons
        game_outcome = battling.choose_your_pokemon
        if game_outcome == "GAME OVER"
            lost += 1
            break
        end
        battling.computer_pokemon(2)
        outcome = battling.run_game #
        if outcome == "win" then win += 1 
        elsif outcome == "lose" then lost += 1
        elsif outcome == "tie" then tie += 1
        end
    end
    if win == 2 then puts "Congrats, you can move on to the final challenger\n\n"
    elsif lost == 2 then return outcome
    elsif tie == 2 then return outcome
    end
    outcome
end