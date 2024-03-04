# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

hotels = [
  { name: 'Taj Hotel', location: 'Mumbai' },
  { name: 'The Oberoi Hotel', location: 'Mumbai' },
  { name: 'The Leela Palace Hotel', location: 'Bengaluru' },
  { name: 'Hyatt hotel', location: 'Ahmedabad' },
  { name: 'Fortune Landmark Hotel', location: 'Ahmedabad' },
  { name: 'Radisson blu Hotel', location: 'Pune' },
  { name: 'Courtyard Marriott Hotel', location: 'Delhi' },
  { name: 'ITC Narmada Hotel', location: 'Delhi' }
]

hotels.each do |hotel_attr|
  Hotel.find_or_create_by(hotel_attr)
end

User.find_or_create_by(
  email: 'dummy_user@gmail.com',
  name: 'Dummy User'
)
