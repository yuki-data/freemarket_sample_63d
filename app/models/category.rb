class Category < ApplicationRecord
  validates :name, presence: true
  has_many :products
  has_ancestry
end
