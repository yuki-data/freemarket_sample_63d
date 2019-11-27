class CreateCwavetests < ActiveRecord::Migration[5.2]
  def change
    create_table :cwavetests do |t|
      t.text :image
      t.timestamps
    end
  end
end
