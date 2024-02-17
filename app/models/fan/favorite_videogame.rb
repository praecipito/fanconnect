module Fan
  class FavoriteVideogame
    include ActiveModel::Model

    attr_accessor :string
    validates :string, presence: true
  end
end
