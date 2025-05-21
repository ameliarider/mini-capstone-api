class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 400 }
  validates :price, numericality: true
  validates :description, length: { in: 4..50 }
  # validates :image_url, inclusion: { in: %w[small medium large] }
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
    "$#{price * 0.09}"
  end
end
