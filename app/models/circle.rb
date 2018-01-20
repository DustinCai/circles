class Circle < ApplicationRecord
  has_many :user_circles
  has_many :users, through: :user_circles
  
  validates :name, length: {minimum: 5, maximum: 20}
  validates :course, length: {minimum: 2, maximum: 20}
  validates :size, presence: true, numericality: {greater_than: 1, less_than: 100, only_integer: true}
end
