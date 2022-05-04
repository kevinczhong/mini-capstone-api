require "http"
require "tty-table"

puts "Would you like to pull the information for one product, or all products?"
pref = gets.chomp
if pref == "all_products"
  response = HTTP.get("http://localhost:3000/all_products")
  all_products = response.parse(:json)
  pp all_products
else
  response = HTTP.get("http://localhost:3000/#{pref}")
  product = response.parse(:json)
  pp product
end
