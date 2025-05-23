class Supplier < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, format: { with: /@/ }
  def products
    Product.where(supplier_id: id)
  end
end
