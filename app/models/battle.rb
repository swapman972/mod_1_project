class Battle

    def initialize
        @battle_pokemon
        @chall_pokemon
        @id_num
    end
    
    def	choose_your_pokemon
        user = Trainer.all.last
        #puts user.pokemons
        list_of_pokemons = user.pokemons.map {|p| p.species}
        if list_of_pokemons.count == 0
            puts "All your pockemon are fainted..."  
            game_over = "GAME OVER"
            return game_over
        end
        puts "\n\nChoose a Pokemon from your team to batlle with"
        puts list_of_pokemons.join(", ")
        name = gets.chomp
        until(list_of_pokemons.include?(name))
            puts "Please choose a pokemon from your team."
            name = gets.chomp
        end
        @battle_pokemon = user.pokemons.find_by(species: name)
        # Interate to confirm that user has that user_ Use array.include? ("whatever we are looking for")
		# if !(pokemon.element == "rock" || pokemon.element == "paper" || pokemon.element == "scissors")
		# 	puts "That's not rock, paper or scissors! Try again..."
		# 	battle_pokemon	
		# else
		puts "\n\nYou are sending #{@battle_pokemon.species} to battle"
	end

    def computer_pokemon(id_num)
        @id_num = id_num
        pokemon = Trainer.all.find(@id_num).pokemons.sample(1)
        puts "Your challenger has chosen #{pokemon[0].species}"
        @chall_pokemon = pokemon[0]
    end
    #Trainer.all.find(2).id
    #battle_pokemon.find_by(species: "Poliwarth").id
    def remove_pokemon_from_user
       pokemon_num = @battle_pokemon.id
       trainer_num = Trainer.all.last.id
       fainted_pokemon = TrainerPokemon.all.find_by(trainer_id: trainer_num, pokemon_id: pokemon_num)
       fainted_pokemon.delete
    end

    def remove_pokemon_from_challenger
        pokemon_num = @chall_pokemon.id
        trainer_num = Trainer.all.find(@id_num).id
        fainted_pokemon = TrainerPokemon.all.find_by(trainer_id: trainer_num, pokemon_id: pokemon_num)
        fainted_pokemon.delete
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
            remove_pokemon_from_challenger
			puts "Fire beats grass - congrats you won!"
        elsif user_element == "grass" && chall_element == "water"
            outcome = "win"
            remove_pokemon_from_challenger
            puts "Grass beats water - congrats you won!"
        elsif user_element == "water" && chall_element == "fire"
            outcome = "win"
            remove_pokemon_from_challenger
			puts "Water beats fire - congrats you won!"
        else
            outcome = "lose" 
            remove_pokemon_from_user
            puts "Unlucky, you lost! Don't give up and try again." 
        end
        outcome
	end
end