class CreateSalingProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :saling_products do |t|
      t.integer :product_id, null:false, foreign_key: true
      t.integer :saling_products, null:false
      t.timestamps
    end
  end
end
