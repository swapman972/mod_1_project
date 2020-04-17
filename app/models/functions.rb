def welcome_user
    puts "Hello young trainer, what is your name?"
    user_name = gets.chomp
    user = Trainer.create(name: user_name)
end

def pokemon_art(art_file)
    File.readlines(art_file) do |line|
      puts line
    end.each {|line| puts line}
end

def pick_starter
    pokemon_art("Venusaur")
    sleep(1)
    pokemon_art("Blastoise")
    sleep(1)
    pokemon_art("Charizard")
    sleep(1)
    puts "Pick a starter pokemon, you can choose between Venusaur, Blastoise and Charizard"
    user_input = gets.chomp
    until (user_input == "Venusaur" or user_input == "Charizard" or user_input == "Blastoise")
        puts "Please pick a starter pokemon between Venusaur, Charizard and Blastoise"
        user_input = gets.chomp
    end
    user_input
end

def wild_encounter(pokemon_strings)
    pokemon_array = Pokemon.where(species: pokemon_strings)
    element_set = Set[]
    for pokemon in pokemon_array do
        element_set.add(pokemon.element)
    end
    valid_pokemon = Pokemon.where.not(element: element_set)
    selected_pokemon = valid_pokemon[rand(valid_pokemon.size)]
end

def wild_encounter_result(user, result)
    savage_encouter(result)
    user.add_pokemon_to_user(result.species)
end

# First battle win condition is to win at least 1 instance
def battle1
    battling = Battle.new
    win = 0
    lost = 0
    tie = 0
    until win == 1 or lost == 2 or tie == 2
        game_outcome = battling.choose_your_pokemon
        if game_outcome == "GAME OVER"
            lost += 1
            break
        end	
        battling.computer_pokemon(1)
        outcome = battling.run_game     
        if outcome == "win" then win += 1 
        elsif outcome == "lose" then lost += 1
        elsif outcome == "tie" then tie += 1
        end
    end
    if win == 1 then puts "Congrats, you can move on to the next challenger\n\n" end
    sleep(3)
   outcome        
end

# Second battle win condition is to win at least 2 instance
def battle2
    battling = Battle.new
    win = 0
    lost = 0
    tie = 0
    until win == 2 or lost == 3 or tie == 3
        game_outcome = battling.choose_your_pokemon
        if game_outcome == "GAME OVER"
            lost += 1
            break
        end
        battling.computer_pokemon(2)
        outcome = battling.run_game 
        if outcome == "win" then win += 1 
        elsif outcome == "lose" then lost += 1
        elsif outcome == "tie" then tie += 1
        end
    end
    if win == 2 then puts "Congrats, you can move on to the final challenger\n\n"
    elsif lost == 3 then return outcome
    elsif tie == 3 then return outcome
    end
    sleep(3)
    outcome
end

# Final battle win condition is to win at least 3 instance
def battle3
    battling = Battle.new
    win = 0
    lost = 0
    tie = 0
    until win == 3 or lost == 3 or tie == 5
        game_outcome = battling.choose_your_pokemon
        if game_outcome == "GAME OVER"
            lost += 1
            break
        end
        battling.computer_pokemon(3)
        outcome = battling.run_game #
        if outcome == "win" then win += 1 
        elsif outcome == "lose" then lost += 1
        elsif outcome == "tie" then tie += 1
        end
    end
    if win == 3 then puts "Congrats, you just beat the elite 3! You are the new champion!!!\n\n"
    elsif lost == 3 then return outcome
    elsif tie == 5 then return outcome
    end
    sleep(3)
    outcome
end

#extra methods for nice output
def savage_encouter(pokemon)
    puts "A wild #{pokemon.species} appeared!" 
    sleep(2)
    print "You try to catch it"
    sleep(0.5)
    print "..."
    sleep(0.5)
    print "......"
    sleep(0.5)
    print "........." 
    sleep(1.5) 
    print "Gotcha!"
    sleep(1.2)
    puts "\n#{pokemon.species} is now part of your team!!!!"
    sleep(1.8)
end