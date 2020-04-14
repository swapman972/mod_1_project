class Pokemon < ActiveRecord::Base
    has_many :trainer_pokemons
    has_many :trainers through: :trainer_pokemons
end