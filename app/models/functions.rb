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
        puts "all your pokemons are healed, battle again"
    end
    if win == 1 then puts "Congrats, you can move on to the final chanllenger"
    end
   outcome        
end

def battle2
    battling = Battle.new
    win = 0
    lost = 0
    tie = 0
    until win == 2 or lost == 2 or tie == 2
        battling.choose_your_pokemon	
        battling.computer_pokemon(2)
        outcome = battling.run_game #
        if outcome == "win" then win += 1 
        elsif outcome == "lose" then lost += 1
        elsif outcome == "tie" then tie += 1
        end
        puts "all your pokemons are healed, battle again"
    end
    if win == 2 then puts "Congrats, you can move on to the final chanllenger"
    elsif lost == 2 then return puts "Sorry, you are not strong enough to move on to the next challenger"
    elsif tie == 2 then return puts "You are stuck in a tie, try catching different pokemon elements"
    end
    outcome
end