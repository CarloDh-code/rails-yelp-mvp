# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#   ``
require 'faker'

puts 'Creating 5 fake restaurants...'
5.times do
  restaurant = Restaurant.new(
    name: Faker::Games::LeagueOfLegends.champion,
    address: Faker::Games::LeagueOfLegends.quote,
    phone_number:'0685059581',
    category: 'italian'
  )
  restaurant.save!
end
puts 'Finished!'
