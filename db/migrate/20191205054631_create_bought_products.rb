class CreateBoughtProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :bought_products do |t|
      t.references :product, foreign_key: true
      t.references :user_profile, foreign_key: true
      t.references :buyer, foreign_key: { to_table: :user_profiles }
      t.timestamps
    end
  end
end
