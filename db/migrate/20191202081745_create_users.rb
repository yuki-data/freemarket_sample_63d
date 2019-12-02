class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nickname, null: false
      t.text :profile, null: false
      t.string :avator
      t.timestamps
    end
  end
end
