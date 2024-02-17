module Fan
  class PreferredChannel
    include ActiveModel::Model
    CHANNEL = ['WhatsApp', 'Email', 'SMS', 'Ligação', 'Telegram']

    attr_accessor :prefiro
    validates :prefiro, presence: true
  end
end
