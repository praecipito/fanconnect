module Fan
  class FavoriteDrink
    include ActiveModel::Model

    attr_accessor :string
    validates :string, presence: true
  end
end
