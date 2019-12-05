class CreateBoughtProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :bought_products do |t|

      t.timestamps
    end
  end
end
