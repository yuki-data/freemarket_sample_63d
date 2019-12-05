class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :user_profile, foreign_key: true
      t.references :category, foreign_key: true
      t.references :brand, foreign_key: true
      t.string :name, null: false
      t.text :description, null: false
      t.integer :status, null: false
      t.integer :who_charge_shipping, null: false
      t.integer :way_of_shipping, null: false
      t.integer :shipping_region, null:false
      t.integer :how_long_shipping, null:false
      t.integer :price, null:false
      t.timestamps
    end
  end
end
