class RemoveNbOfPokemonFromTrainerTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :trainers, :nb_of_pokemon
  end
end
