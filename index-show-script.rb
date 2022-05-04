require "http"
# puts "If you would like the index, please type in index. Else, please type in the id of the product you would like to access the information of."
# pref = gets.chomp
# if pref == "index"
#   response = HTTP.get("http://localhost:3000/products")
#   index = response.parse(:json)
#   pp index
# else
#   response = HTTP.get("http://localhost:3000/products" + "/#{pref.to_i}")
#   show = response.parse(:json)
#   pp show
# end

response = HTTP.get("http://localhost:3000/products/3")
update = response.parse(:json)
puts "What would you like to update?"
pref = gets.chomp
if pref == "name"
elsif pref == "price"
elsif pref == "image_url"
elsif pref == "description"
end
