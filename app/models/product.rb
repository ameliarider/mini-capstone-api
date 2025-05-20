class Product < ApplicationRecord
  def formatted_price
    "$#{price}"
  end

  def formatted_created_at
    created_at.strftime("%b %d, %Y")
  end

  def is_discounted?
    if price < 10
      true
    else
      false
    end
  end

  def tax
    tax = price * 0.09
    "$#{tax}"
  end
end
