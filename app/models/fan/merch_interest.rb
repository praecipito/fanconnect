module Fan
  class MerchInterest
    include ActiveModel::Model
    MERCH = ['Sim', 'Não']

    attr_accessor :interesse
    validates :interesse, presence: true
  end
end
