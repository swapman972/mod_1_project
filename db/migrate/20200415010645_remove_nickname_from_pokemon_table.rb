class RemoveNicknameFromPokemonTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :pokemons, :nickname
  end
end
