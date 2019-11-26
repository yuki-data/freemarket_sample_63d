class CreateBoughatProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :boughat_products do |t|
      t.integer :product_id, null:false, foreign_key: true
      t.integer :bought_products, null:false
      t.timestamps
    end
  end
end
