require 'rest-client'
require_relative '../config/environment'
require 'pry'

#n_name = nick_mane(user_input) that is if we want to add nick names later

def run
    battle = Battle.new
    user = welcome_user
    puts "Welcome to the Elite 3 #{user.name}!!"
    starter = pick_starter
    user.adding_starter_to_user(starter)
    puts "Awesome! #{starter} is now part of your team!!"
    outcome = nil
    until outcome == "win" or outcome == "lose"
        battle.choose_your_pokemon	
        battle.computer_pokemon
        outcome = battle.run_game
    end
end

run