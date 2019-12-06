class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.references :user, foreign_key: true
      t.string :nickname, null: false
      t.text :profile
      t.string :avator
      t.timestamps
    end
  end
end
