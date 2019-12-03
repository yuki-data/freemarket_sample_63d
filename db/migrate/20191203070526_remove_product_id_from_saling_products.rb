class RemoveProductIdFromSalingProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :saling_products, :product_id, :integer
  end
end
