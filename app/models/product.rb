class Product < ApplicationRecord
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

  def image_todo
    if image_url == "placeholder"
      return "This product still needs an image."
    else
      return "Image ready."
    end
  end

  def tax
    tax = price * 0.09
    tax = tax.truncate(2)
    return tax
  end

  def total
    total = price + tax
    return total
  end
end
