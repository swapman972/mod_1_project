class Trainer < ActiveRecord::Base
    has_many :trainer_pokemons
    has_many :pokemons, through: :trainer_pokemons

#helper method to add pokemon started to his table
def adding_starter_to_user(poke)
    if poke == "Venusaur"
        venusaur = Pokemon.all.find {|p| p.species == "Venusaur"}
        self.pokemons << venusaur
    elsif poke == "Charizard"
        self.pokemons << charizard
    elsif poke == "Blastoise"
        self.pokemons << blastoise    
    end
end
    # def select_pokemon
    #     puts self.pokemons
    # end
end