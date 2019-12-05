class CreateSalingProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :saling_products do |t|

      t.timestamps
    end
  end
end
