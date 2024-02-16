module Fan
  class Weight
    include ActiveModel::Model

    attr_accessor :number
    validates :number, presence: true
  end
end
