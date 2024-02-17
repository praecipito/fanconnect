class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile

  after_create :generate_profile

  def calculate_match(player)
    match_score = 0

    weights = {
      height: 5,
      favorite_shirt_number: 3,
      birth_city: 2
    }

    weights.each do |field, weight|
      match_score += weight if profile.send(field) == player.send(field)
    end

    match_score
  end

  def find_best_match(players)
    best_match = nil
    highest_score = 0

    # Itera sobre os jogadores para encontrar o melhor match
    players.each do |player|
      match_score = calculate_match(player)

      if match_score > highest_score
        highest_score = match_score
        best_match = player
      end
    end

    best_match || 'Abel Ferreira'
  end

  def generate_profile
    return if self.profile.present?

    Profile.create(user: self)
  end
end
