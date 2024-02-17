class AddUpperImageUrlToPlayers < ActiveRecord::Migration[7.0]
  def change
    add_column :players, :upper_image_url, :string
  end
end
