class Review < ActiveRecord::Base
  attr_accessible :restaurant_id, :user_feedback, :user_id
  
  belongs_to :customer
  belongs_to :restaurant
  validates :user_feedback, length: {maximum: 500}
  validates :restaurant_id, presence: true
  validates :user_id, presence: true
end
