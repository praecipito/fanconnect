# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'csv'

csv_file_path = Rails.root.join('lib', 'seeds', 'profile_data.csv')

Profile.destroy_all
User.destroy_all

counter = 1
CSV.foreach(csv_file_path, headers: true, header_converters: :symbol) do |row|

  user = User.create! email: "user_#{counter}@gmail.com", password: '123465'
  p user
  profile = Profile.create!(favorite_shirt_number: row[:numero_de_camisa_preferido], shoe_size: row[:tamanho_do_sapato],
    number_of_children: row[:quantidade_de_filhos], height: row[:altura], weight: row[:peso], birth_city: row[:cidade_de_nascimento],
    minimum_income: row[:renda].split(" a ")[0].to_i, maximum_income: row[:renda].split(" a ")[1].to_i, favorite_food: row[:comida_favorita],
    favorite_drink: row[:bebida_favorita], preferred_look: row[:look_que_mais_combina], favorite_videogame: row[:videogame_favorito],
    membership_duration: row[:tempo_de_associacao_torcedor_m], sport_interest: row[:modalidade_esportiva_interesse], merchandising_interest: row[:interesse_em_merchandising],
    preferred_communication_channel: row[:canal_de_comunicacao_preferido], user: user)
  p profile
  counter += 1
end
