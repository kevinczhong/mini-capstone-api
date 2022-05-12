# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Product.create(name: "Water Bottle", price: "4.99", image_url: "placeholder", description: "A water bottle")
# Product.create(name: "Backpack", price: "29.99", image_url: "placeholder", description: "A backpack")
# Product.create(name: "Hiking shoes", price: "99.99", image_url: "placeholder", description: "A pair of hiking shoes")

# Supplier.create(name: "Shoe Company Ltd", email: "shoecompany@shoes.com", phone_number: "1234567890")
# Supplier.create(name: "Outdoors Utility Inc", email: "outdoors@outu.com", phone_number: "2345678901")

product_id = 1
8.times do
  Image.create(image_url: "placeholder", product_id: product_id)
  Image.create(image_url: "placeholder", product_id: product_id)
  product_id += 1
end
