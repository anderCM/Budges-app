class User < ApplicationRecord
  validates :name, presence: true, length: { minimun: 2, maximun: 150 }

  has_many :groups
  has_many :entities
end
