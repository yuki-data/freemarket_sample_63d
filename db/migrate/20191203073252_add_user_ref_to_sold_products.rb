class AddUserRefToSoldProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :sold_products, :user, foreign_key: true
    add_reference :saling_products, :user, foreign_key: true
    add_reference :bought_products, :user, foreign_key: true
  end
end
