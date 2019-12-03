class RemoveSoldProductsFromSoldProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :sold_products, :sold_products, :integer
    remove_column :saling_products, :saling_products, :integer
    remove_column :bought_products, :bought_products, :integer
  end
end
