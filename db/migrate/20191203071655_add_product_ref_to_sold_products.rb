class AddProductRefToSoldProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :sold_products, :product, foreign_key: true
    add_reference :saling_products, :product, foreign_key: true
    add_reference :bought_products, :product, foreign_key: true
  end
end
