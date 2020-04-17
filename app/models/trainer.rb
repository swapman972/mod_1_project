class Trainer < ActiveRecord::Base
    has_many :trainer_pokemons
    has_many :pokemons, through: :trainer_pokemons

#helper method to add pokemon started to his table
    def add_pokemon_to_user(poke)
        pokemon = Pokemon.all.find {|p| p.species == poke}
            self.pokemons << pokemon
    end

end