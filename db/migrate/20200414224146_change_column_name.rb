class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :pokemons, :type, :element
  end
end
