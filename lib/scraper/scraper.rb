require 'httparty'
require 'nokogiri'
require 'csv'


def scrape_players_url
  url = 'https://www.palmeiras.com.br/elenco/'
  # make http request && parse using Nokogiri
  doc = Nokogiri::HTML.parse(HTTParty.get(url))
  player_urls = doc.search('.futebolprofissional.box-elenco.col.col-6.col-sm-6.col-md-6.col-lg-3.col-xl-3').map do |element|
    element.search('a').first.attribute('href').value
  end

  # p player_urls.size
  player_urls
end

def scrape_player(url)
  doc = Nokogiri::HTML.parse(HTTParty.get(url))
  # Imagem do atleta em pé
  full_player_image = doc.search('.foto-jogador img').first
  player_full_image_url = full_player_image.attribute('src').value

  # Nome da camisa
  shirt_name = doc.search('.info-jogadores h1').first.text.strip.capitalize

  top_image_data = doc.search('.info-jogadores h4').text.split
  # Idade
  age = top_image_data.first(2).join(' ').gsub(',', '')
  # Posição
  position = top_image_data[2].gsub(/\d/, '')
  # Numero da camisa
  shirt_number = doc.search('.info-jogadores .num-camisa').first.text.strip.to_i
  # Text descritivo
  player_text = doc.search('.row.conteudo-jogador .txt-jogador').text.strip

  # Imagem atleta tronco
  upper_image = doc.search('.item.selecionado img').first.attribute('src').value

  # Exgtraindo container com dados do atleta
  player_data = []
  doc.search('.row.conteudo-jogador .dados-jogador .row.quadro-content .col').each do |element|
    player_data << element.search('span').text.strip.split("\n")
  end
  player_data = player_data.flatten
  # Nome completo
  full_name = player_data[0].strip
  # Data de nascimento
  birth_date = player_data[1].strip
  # Cidade de nascimento
  birth_city = player_data[2].strip
  # Altura
  height = player_data[3].strip

  player = {
    full_name:,
    shirt_name:,
    age:,
    position:,
    shirt_number:,
    player_text:,
    birth_date:,
    birth_city:,
    height:,
    player_full_image_url:,
    upper_image:
  }
  player
end
