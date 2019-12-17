class AddAndDeleteColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birth_day, :date, null: false
    remove_column :users, :year_of_birth
    remove_column :users, :month_of_birth
    remove_column :users, :day_of_birth
  end
end
