class Entity < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 1 }

  belongs_to :author, class_name: 'User'
  has_many :entity_groups, dependent: :destroy
end
