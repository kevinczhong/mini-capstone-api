class Category < ApplicationRecord
  has_many :category_products
  has_many :products, through: :category_products

  # def products
  #   # Non-functional
  #   # products_array = []
  #   # for category_product in category_products
  #   #   if category_product.category
  #   #     products_array << category_product.product
  #   #   end
  #   # end
  #   products_array = category_products.map { |category_product| category_product.product }
  #   return products_array
  # end
end
