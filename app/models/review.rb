class Review < ActiveRecord::Base
  attr_accessible :restaurant_id, :user_feedback, :user_id
  
  belongs_to :customer, foreign_key: "user_id" 
  belongs_to :restaurant
  validates :user_feedback, length: {maximum: 300}
  validates_presence_of :restaurant_id, :user_id
end
