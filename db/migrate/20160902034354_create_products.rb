class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :product_id
      t.string :image
      t.string :title
      t.integer :price
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :quantity

      t.timestamps
    end
  end
end
