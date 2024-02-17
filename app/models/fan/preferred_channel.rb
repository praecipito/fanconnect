module Fan
  class PreferredChannel
    include ActiveModel::Model
    CHANNEL = ['WhatsApp', 'Email', 'SMS', 'Ligação', 'Telegram']

    attr_accessor :string
    validates :string, presence: true
  end
end
