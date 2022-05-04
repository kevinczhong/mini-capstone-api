require "http"
require "tty-table"

# puts "Would you like to pull the information for one product, or all products?"
# pref = gets.chomp
# if pref == "all_products"
#   response = HTTP.get("http://localhost:3000/all_products")
#   all_products = response.parse(:json)
#   pp all_products
# else
#   response = HTTP.get("http://localhost:3000/#{pref}")
#   product = response.parse(:json)
#   pp product
# end

response = HTTP.get("http://localhost:3000/all_products")
all_products = response.parse(:json)["products"]
product_table = TTY::Table.new(["Name", "Price"], [["#{all_products[0]["name"]}", "#{all_products[0]["price"]}"], ["#{all_products[1]["name"]}", "#{all_products[1]["price"]}"], ["#{all_products[2]["name"]}", "#{all_products[2]["price"]}"]])

puts product_table.render(:ascii)
