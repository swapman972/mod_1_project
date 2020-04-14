class Trainer < ActiveRecord::Base
    has_many :trainer_pokemons
    has_many :pokemons through: :trainer_pokemons


    def select_pokemon
        puts self.pokemons
    end
end