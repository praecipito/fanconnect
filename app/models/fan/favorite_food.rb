module Fan
  class FavoriteFood
    include ActiveModel::Model

    attr_accessor :string
    validates :string, presence: true
  end
end
