class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile

  after_create :generate_profile

  def generate_profile
    return if self.profile.present?

    Profile.create(user: self)
  end
end
