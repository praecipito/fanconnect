class Player < ApplicationRecord

  def position_abbreviate
    positions = {
      'Goleiro' => 'GK',
      'Lateral-Direito' => 'LD',
      'Lateral-Esquerdo' => 'LE',
      'Zagueiro' => 'ZAG',
      'Meio-Campista' => 'MC',
      'Atacante' => 'AT',
      'Técnico' => 'TEC'
    }

    return positions[self.position]
  end
end
