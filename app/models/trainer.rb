class Trainer 
    has_many :trainer_pokemons
    has_many :pokemons through: :trainer_pokemons
end