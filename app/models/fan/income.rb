module Fan
  class Income
    include ActiveModel::Model
    INCOMES = ['0 a 1500', '1501 a 2500', '2501 a 5000', '5001 a 10000', '10001 a 20000']

    attr_accessor :renda
    validates :renda, presence: true
  end
end
