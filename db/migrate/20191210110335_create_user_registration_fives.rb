class CreateUserRegistrationFives < ActiveRecord::Migration[5.2]
  def change
    create_table :user_registration_fives do |t|

      t.timestamps
    end
  end
end
