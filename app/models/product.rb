class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 400 }
  validates :price, numericality: true
  validates :description, length: { in: 4..50 }
  belongs_to :supplier
  has_many :images
  has_many :orders
  def formatted_price
    if price
      "$#{price}"
    else
      "Item missing price"
    end
  end

  def formatted_created_at
    created_at.strftime("%b %d, %Y")
  end

  def is_discounted?
    if price
      if price < 10
        true
      else
        false
      end
    else
      false
    end
  end

  def tax
    if price
      "$#{price * 0.09}"
    else
      "No tax because no price"
    end
  end

  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end
end
