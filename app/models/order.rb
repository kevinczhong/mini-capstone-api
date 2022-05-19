class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :carted_products, optional: true

  # def user
  #   user = User.find_by(id: user_id)
  # end

  # def product
  #   product = Product.find_by(id: product_id)
  # end

  # def subtotal
  # end

  # def tax
  # end

  # def total
  # end
end
