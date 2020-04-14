class CreateTrainerPokemon < ActiveRecord::Migration[6.0]
  def change
    create_table :trainer_pokemons do |t|
      t.integer :trainer_id
      t.integer :pokemon_id
      t.boolean :fainted, default: false
    end

  end
end
