class Group < ApplicationRecord
  # validates :title, presence :true
  belongs_to :user
  has_many :posts
  validates :title, presence: true
  has_many :group_ralationships
  has_many :members, through: :group_ralationships, source: :user
end
