class ProductsController < ApplicationController
  def index
    @products = Product.all
    render template: "products/index"
  end

  def show
    @product = Product.find_by(id: params["id"])
    render template: "products/show"
    # render json: product.as_json(methods: [:is_discounted?, :is_shoe?, :image_todo, :tax, :total])
  end

  def create
    product = Product.new(
      name: params["name"],
      price: params["price"],
      images_url: params["image_url"],
      description: params["description"],
      supplier_id: params["supplier_id"],
      # name: "Pants",
      # price: 20,
      # image_url: "placeholder",
      # description: "A pair of pants",
    )
    if product.save
      @product = product
      render template: "products/show"
    else
      render json: { error_message: product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    product = Product.find_by(id: params["id"])
    # product.name = params["name"]
    # product.price = params["price"]
    # product.image_url = params["image_url"]
    # product.description = params["description"]
    product.update(
      name: params["name"] || product.name,
      price: params["price"] || product.price,
      image_url: params["image_url"] || product.image_url,
      description: params["description"] || product.description,
      supplier_id: params["supplier_id"] || product.supplier_id,
    )
    if product.save
      @product = product
      render template: "products/show"
    else
      render json: { error_message: product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    product = Product.find_by(id: params["id"])
    product.destroy
    render json: { message: "This product has been removed from inventory." }
  end
end

# def water_bottle
#   render json: { product: Product.find_by(name: "Water Bottle") }
# end

# def backpack
#   render json: { product: Product.find_by(name: "Backpack") }
# end

# def hiking_shoes
#   render json: { product: Product.find_by(name: "Hiking shoes") }
# end

#Independently specifying methods/paths for individual products seems completely untenable with scale. There has to be a way to automate this.
