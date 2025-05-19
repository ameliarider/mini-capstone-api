# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# length = 3
# price = 75
# 10.times do
#   product = Product.new(name: "earrings", price: "#{price}", image_url: "earrings_img", description: "#{length} cm")
#   product.save
#   price += 5
#   length += 1
# end

product = Product.find(12)
product.description = "gold"
product.save
