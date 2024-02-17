module Fan
  class PreferredLook
    include ActiveModel::Model

    OPTIONS = ['Casual', 'Urbano', 'Esportivo', 'Alternativo', 'Elegante', 'Vintage']

    attr_accessor :string
    validates :string, presence: true
  end
end
