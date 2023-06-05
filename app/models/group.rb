class Group < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :icon, presence: true

  belongs_to :user
  has_many :entity_categories, dependent: :destroy
end
