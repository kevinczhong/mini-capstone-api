require "rails_helper"

RSpec.describe "Products", type: :request do
  describe "GET /products" do
    it "should return an array of products" do
      supplier = Supplier.create!({ name: "Test Supplier", email: "supplier@test.com", phone_number: "1234567890" })
      Product.create!([{ name: "Test Product", price: 10.99, description: "This is a test description", supplier_id: supplier.id }])
      get "/products.json"
      products = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(products.length).to eq(1)
    end
  end

  describe "GET /products/:id" do
    it "should return a specific product" do
      supplier = Supplier.create!({ name: "Test Supplier", email: "supplier@test.com", phone_number: "1234567890" })
      product = Product.create!({ name: "Test Product", price: 10.99, description: "This is a test description", supplier_id: supplier.id })
      get "/products/#{product.id}.json"
      product_response = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(product_response["name"]).to eq("Test Product")
      expect(product_response["price"]).to eq("10.99")
      expect(product_response["supplier_id"]).to eq(supplier.id)
    end

    it "should return a bad request error if the product does not exist" do
      supplier = Supplier.create!({ name: "Test Supplier", email: "supplier@test.com", phone_number: "1234567890" })
      product = Product.create!({ name: "Test Product", price: 10.99, description: "This is a test description", supplier_id: supplier.id })
      get "/products/1.json"
      product_response = JSON.parse(response.body)
      expect(response).to have_http_status(500)
    end
  end

  describe "POST /products" do
    it "should create a post and return that created post, if a logged-in admin created the product" do
      supplier = Supplier.create!({ name: "Test Supplier", email: "supplier@test.com", phone_number: "1234567890" })
      admin = User.create!(name: "test_admin", email: "admin@test.com", password_digest: "password", admin: true)
      jwt = JWT.encode(
        {
          user_id: admin.id, # the data to encode
          exp: 24.hours.from_now.to_i, # the expiration time
        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        "HS256" # the encryption algorithm
      )
      post "/products.json", params: { name: "Test Product", price: 10.99, description: "This is a test description", supplier_id: supplier.id }, headers: { Authorization: "Bearer #{jwt}" }
      post_response = JSON.parse(response.body)
      expect(response).to have_http_status(200)
    end
  end

  describe "PATCH /products/:id" do
    it "should return the updated post, if and only if the post is being updated by an admin and the data being passed in is good" do
      supplier = Supplier.create!({ name: "Test Supplier", email: "supplier@test.com", phone_number: "1234567890" })
      admin = User.create!(name: "test_admin", email: "admin@test.com", password_digest: "password", admin: true)
      jwt = JWT.encode(
        {
          user_id: admin.id, # the data to encode
          exp: 24.hours.from_now.to_i, # the expiration time
        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        "HS256" # the encryption algorithm
      )
      product = Product.create!({ name: "Test Product", price: 10.99, description: "This is a test description", supplier_id: supplier.id })
      patch "/products/#{product.id}.json", params: { name: "Test Product 2" }, headers: { Authorization: "Bearer #{jwt}" }
      product_response = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(product_response["name"]).to eq("Test Product 2")
    end
  end

  describe "DELETE /products/:id" do
    it "should return 200 if the post in question was successfully deleted" do
      supplier = Supplier.create!({ name: "Test Supplier", email: "supplier@test.com", phone_number: "1234567890" })
      admin = User.create!(name: "test_admin", email: "admin@test.com", password_digest: "password", admin: true)
      jwt = JWT.encode(
        {
          user_id: admin.id, # the data to encode
          exp: 24.hours.from_now.to_i, # the expiration time
        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        "HS256" # the encryption algorithm
      )
      product = Product.create!({ name: "Test Product", price: 10.99, description: "This is a test description", supplier_id: supplier.id })
      delete "/products/#{product.id}.json", headers: { Authorization: "Bearer #{jwt}" }
      expect(response).to have_http_status(200)
    end
  end
end
