class AddMoreDetailsToPlayers < ActiveRecord::Migration[7.0]
  def change
    add_column :players, :full_name, :string
    add_column :players, :shirt_name, :string
    add_column :players, :age, :integer
    add_column :players, :description, :text
    add_column :players, :body_image_url, :string
  end
end
