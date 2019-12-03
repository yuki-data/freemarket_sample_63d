class AddBuyerRefToSoldProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :sold_products, :buyer, foreign_key: { to_table: :users }
    add_reference :bought_products, :buyer, foreign_key: { to_table: :users }
  end
end
