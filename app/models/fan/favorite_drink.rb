module Fan
  class FavoriteDrink
    include ActiveModel::Model
  OPTIONS = ['Cerveja', 'Refrigerante', 'Vinho', 'Caipirinha', 'Café', 'Suco', 'Saque']

    attr_accessor :string
    validates :string, presence: true
  end
end
