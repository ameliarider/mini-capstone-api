class Supplier < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, format: { with: /@/ }
  has_many :products, dependent: :destroy
  # def products
  #   Product.where(supplier_id: id)
  # end
end
