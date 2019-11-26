class CreateSoldProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :sold_products do |t|
      t.integer :product_id, null:false, foreign_key: true
      t.integer :sold_products, null:false
      t.timestamps
    end
  end
end
