class RemoveProductIdFromSoldProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :sold_products, :product_id, :integer
    remove_column :bought_products, :product_id, :integer
  end
end
