class RemoveProductIdFromProductImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :product_images, :product_id, :integer
  end
end
