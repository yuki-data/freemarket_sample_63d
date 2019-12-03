class RenameBoughatProductsToBoughtProducts < ActiveRecord::Migration[5.2]
  def change
    rename_table :boughat_products, :bought_products
  end
end
