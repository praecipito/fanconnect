class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.integer :favorite_shirt_number
      t.integer :shoe_size
      t.integer :number_of_children
      t.integer :height
      t.integer :weight
      t.string :birth_city
      t.integer :minimum_income
      t.integer :maximum_income
      t.string :favorite_food
      t.string :favorite_drink
      t.string :preferred_look
      t.string :favorite_videogame
      t.integer :membership_duration
      t.string :sport_interest
      t.boolean :merchandising_interest
      t.string :preferred_communication_channel

      t.timestamps
    end
  end
end
