class Battle

    def initialize
        @battle_pokemon
        @chall_pokemon
    end
    
    def	choose_your_pokemon
        user = Trainer.all.last
        puts user.pokemons
        puts "Choose a Pokemon from your team to start with"
        puts user.pokemons.map {|p| p.species}
        name = gets.chomp
        @battle_pokemon = user.pokemons.find_by(species: name)
        # Interate to confirm that user has that user_ Use array.include? ("whatever we are looking for")
		# if !(pokemon.element == "rock" || pokemon.element == "paper" || pokemon.element == "scissors")
		# 	puts "That's not rock, paper or scissors! Try again..."
		# 	battle_pokemon	
		# else
		puts "You are sending #{@battle_pokemon.species} to battle"

	end

    def computer_pokemon
		pokemon = Trainer.all.first.pokemons.sample(1)
        puts "Your challenger has chosen #{pokemon[0].species}"
        @chall_pokemon = pokemon[0]
	end

    def run_game
        outcome = nil
        user_element = @battle_pokemon.element
        chall_element = @chall_pokemon.element
        if user_element == chall_element
            outcome = "tie"
			puts "It's a #{outcome}, please choose a different pokemon."
        elsif user_element == "fire" && chall_element== "grass"
            outcome = "win"
			puts "fire beats grass - congrats you won!"
        elsif user_element == "grass" && chall_element == "water"
            outcome = "win"
            puts "grass beats water - congrats you won!"
        elsif user_element == "water" && chall_element == "fire"
            outcome = "win"
			puts "water beats fire - congrats you won!"
        else
            outcome = "lose" 
            puts "Unlucky, you lost! Don't give up and try again." 
        end
        outcome
	end
end