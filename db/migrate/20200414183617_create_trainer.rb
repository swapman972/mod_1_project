class CreateTrainer < ActiveRecord::Migration[6.0]
  def change
    create_table :trainers do |t|
      t.string :name
      t.integer :nb_of_pokemon
    end
  end
end
