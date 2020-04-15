class Battle

    def initialize
        @battle_pokemon
        @chall_pokemon
        # @num
    end
    
    def	choose_your_pokemon
        user = Trainer.all.last
        puts user.pokemons
        puts "Choose your Pokemon from your team"
        puts user.pokemons.map {|p| p.species}
        name = gets.chomp
        @battle_pokemon = user.pokemons.find_by(species: name)
        # Interate to confirm that user has that user_ Use array.include? ("whatever we are looking for")
		# if !(pokemon.element == "rock" || pokemon.element == "paper" || pokemon.element == "scissors")
		# 	puts "That's not rock, paper or scissors! Try again..."
		# 	battle_pokemon	
		# else
			puts "You have chosen #{@battle_pokemon.species}"

	end

    def computer_pokemon
		pokemon = Trainer.all.first.pokemons.sample(1)
        puts "Computer has chosen #{pokemon[0].species}"
        @chall_pokemon = pokemon[0]
	end

    def run_game
        outcome = nil
        user_element = @battle_pokemon.element
        chall_element = @chall_pokemon.element
        if user_element == chall_element
            outcome = "tie"
			puts "It's a #{outcome}"
        elsif user_element == "fire" && chall_element== "grass"
            outcome = "win"
			puts "fire beats grass - you won!"
        elsif user_element == "grass" && chall_element == "water"
            outcome = "win"
            puts "grass beats water - you won!"
        elsif user_element == "water" && chall_element == "fire"
            outcome = "win"
			puts "water beats fire - you won!"
        else
            outcome = "lose" 
            puts "Unlucky, you lost!" 
        end
        outcome
	end

# 	def play_again?
# 		sleep(1)
# 		puts "Would you like to play again?"
# 		answer = gets.chomp.downcase
# 		if answer == "yes"
# 			start
# 		elsif answer == "no"
# 			puts "Thanks for playing #{@player_name}!"
# 		else
# 			puts "YES or NO?"
# 			play_again?
# 		end
# 	end
end

# def start
# 	game = Rps.new
# 		game.intro
# 		puts "Choose your weapon! Rock, paper or scissors?"
#      while true
# 		game.chall_pokemon
# 		game.choose_your_pokemon	
# 		outcome = game.run_game
#       if outcome = "win" || "lost"
#       break 
#       end
#      end
# 		game.play_again?
# end
# start 

# end