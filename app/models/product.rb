class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { only_decimal: true }
  validates :price, comparison: { greater_than_or_equal_to: 0 }
  validates :description, presence: true
  validates :description, length: { in: 10..500 }
  belongs_to :supplier
  has_many :orders
  has_many :category_products
  has_many :images
  has_many :categories, through: :category_products

  def is_discounted?
    if price < 10
      return true
    else
      return false
    end
  end

  def is_shoe?
    check = name.split(" ")
    if check[1] == "Shoes"
      return true
    else
      return false
    end
  end

  # def image_todo
  #   if image_url == "placeholder"
  #     return "This product still needs an image."
  #   else
  #     return "Image ready."
  #   end
  # end

  def tax
    tax = price * 0.09
    tax = tax.truncate(2)
    return tax
  end

  def total
    total = price + tax
    return total
  end

  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  # def images
  #   Image.where(product_id: id)
  # end
  # def categories
  #   categories_array = category_products.map { |category_product| category_product.category }
  #   return categories_array
  # end
end
