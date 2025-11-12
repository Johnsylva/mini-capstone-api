# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

Product.destroy_all
Supplier.destroy_all

supplier = Supplier.create(name: "John", email: "john@gmail.com", phone_number: 817483173)

i = 1
10.times do
  Product.create!(
    name: Faker::Name.unique.name,
    price: i + 10,
    supplier_id: supplier.id
  )
  i = i +1
end

# product = Product.create(
#   name: "car",
#   price = 180000,
#   image_url: ""
#   description: "BMW X1"
# )

puts "-------"
puts "created 1 supplier, 10 recipes"
puts "-------"