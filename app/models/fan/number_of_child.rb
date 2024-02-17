module Fan
  class NumberOfChild
    include ActiveModel::Model

    attr_accessor :number
    validates :number, presence: true
  end
end


