class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 400 }
  validates :price, numericality: true
  belongs_to :supplier
  has_many :images, dependent: :destroy
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products
  has_many :orders, through: :carted_products
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

  def primary_image_url
    if images.length > 0
      images[0].url
    else
      "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg"
    end
  end
end
