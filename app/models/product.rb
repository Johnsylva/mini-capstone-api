class Product < ApplicationRecord
  def is_discounted
    if price && price <= 10
      true
    else
      false
    end
  end

  def tax
    tax = price * 0.09
    return tax.round(2)
  end

  def total
    puts tax
    total = price + tax
    return total
  end

  def friendly_created_at
    created_at.strftime("%b %e, %l:%M %p")
  end

end
