class Product < ApplicationRecord
  def is_discounted?
    if price < 10
      return true
    else
      return false
    end
  end

  def tax
    tax = price.to_f * 0.09
    tax = tax.truncate(2)
    return tax
  end

  def total
    total = price + tax
    return total
  end
end
