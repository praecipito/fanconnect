module Fan
  class FavoriteFood
    include ActiveModel::Model
  OPTIONS = ['Bacalhau', 'Feijoada', 'Churrasco', 'Pizza', 'Tacos', 'Lasanha', 'Sushi', 'Hambúrguer', 'Acarajé']

    attr_accessor :string
    validates :string, presence: true
  end
end
