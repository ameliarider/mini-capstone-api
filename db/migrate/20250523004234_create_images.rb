class CreateImages < ActiveRecord::Migration[7.2]
  def change
    create_table :images do |t|
      t.string :url
      t.string :description

      t.timestamps
    end
  end
end
