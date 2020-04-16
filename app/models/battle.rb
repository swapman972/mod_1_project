class Battle

    def initialize
        @battle_pokemon
        @chall_pokemon
        @id_num
    end
    
    def	choose_your_pokemon
        user = Trainer.all.last
        trainer_pokemon_not_fainted = TrainerPokemon.all.where(trainer_id: user.id, fainted: false)
        list_of_pokemons = trainer_pokemon_not_fainted.map{|p| Pokemon.find_by(id: p.pokemon_id).species}

        if list_of_pokemons.count == 0
            puts "All your pockemon are fainted..."  
            game_over = "GAME OVER"
            return game_over
        end
        puts "\nTime for battle!"
        sleep(1.8)
        puts "Choose a Pokemon to battle with:"
        puts list_of_pokemons.join(", ")
        name = gets.chomp
        until(list_of_pokemons.include?(name))
            puts "Please choose a pokemon from your team."
            name = gets.chomp
        end
        @battle_pokemon = user.pokemons.find_by(species: name)
        puts "\nYou chose to send #{@battle_pokemon.species} to battle"
        sleep(1.8)
	end

    def computer_pokemon(id_num)
        @id_num = id_num
        pokemon = Trainer.all.find(@id_num).pokemons.sample(1)
        puts "Your challenger has chosen #{pokemon[0].species}"
        sleep(1.8)
        @chall_pokemon = pokemon[0]
    end

    def remove_pokemon_from_user
       pokemon_num = @battle_pokemon.id
       trainer_num = Trainer.all.last.id
       fainted_pokemon = TrainerPokemon.all.find_by(trainer_id: trainer_num, pokemon_id: pokemon_num)
       fainted_pokemon.fainted = true
       fainted_pokemon.save
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
			puts "It's a #{outcome}, please choose another pokemon."
        elsif user_element == "fire" && chall_element== "grass"
            outcome = "win"
            remove_pokemon_from_challenger
			puts "\nFire beats grass - you won!"
        elsif user_element == "grass" && chall_element == "water"
            outcome = "win"
            remove_pokemon_from_challenger
            puts "\nGrass beats water - you won!"
        elsif user_element == "water" && chall_element == "fire"
            outcome = "win"
            remove_pokemon_from_challenger
			puts "\nWater beats fire - you won!"
        else
            outcome = "lose" 
            remove_pokemon_from_user
            puts "Unlucky, you lost! Don't give up and try again." 
        end
        outcome
	end
end