module Fan
  class FavoriteVideogame
    include ActiveModel::Model
    OPTIONS = ['Fortnite', 'Fifa', 'Call of Duty', 'Minecraft', 'PES', 'League of Legends']

    attr_accessor :string
    validates :string, presence: true
  end
end
