require "http"
response = HTTP.get("http://localhost:3000/products")
index = response.parse(:json)
pp index
