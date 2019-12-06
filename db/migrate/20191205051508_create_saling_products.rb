class CreateSalingProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :saling_products do |t|
      t.references :product, foreign_key: true
      t.references :user_profile, foreign_key: true
      t.timestamps
    end
  end
end
