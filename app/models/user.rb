class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :user_profile
  with_options presence: true do
    validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :last_name_kana
    validates :year_of_birth
    validates :month_of_birth
    validates :day_of_birth
    validates :phone_number
  end
end
