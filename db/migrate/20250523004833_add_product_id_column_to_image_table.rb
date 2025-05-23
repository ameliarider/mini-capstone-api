class AddProductIdColumnToImageTable < ActiveRecord::Migration[7.2]
  def change
    add_column :images, :product_id, :integer
  end
end
