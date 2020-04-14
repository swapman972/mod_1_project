require 'rest-client'
require_relative '../config/environment'
require 'pry'

def welcome_user
    puts "Hello new trainer, what is your name?"
    user_name = gets.chomp
    user_name
end

def pick_starter
    puts "What is your fav food"
    fav_food = gets.chomp
    food = Food.find_or_create_by(name: fav_food)
    food
end

def run
    user_name = welcome_user
    puts "Welcome to the Elite 3 #{user_name}!!"
    food = get_food
    puts "Awesome! #{food.name} is my fav too"

end

run