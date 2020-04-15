require 'rest-client'
require_relative '../config/environment'
require 'pry'

#n_name = nick_mane(user_input) that is if we want to add nick names later

def run
    user = welcome_user
    puts "Welcome to the Elite 3 #{user.name}!!"
    starter = pick_starter
    user.adding_starter_to_user(starter)
    puts "Awesome! #{starter} is now part of your team!!"
    outcome = nil
    outcome = battle1
    if outcome == "lose" then return "Sorry, you are not strong enough to move on to the next challenger"
    elsif outcome == "tie" then return "You are stuck in a tie, try catching different pokemon elements"
    end
    starter = pick_starter              #it should be a wild encounter here
    user.adding_starter_to_user(starter)#here 
    outcome = battle2
    if outcome == "lose" then return
    elsif outcome == "tie" then return 
    end
    #battle3
end

run