class Rating < ActiveRecord::Base
  attr_accessible :restaurant_id, :user_id, :user_rating
  belongs_to :restaurant
  belongs_to :customer

  validates :restaurant_id, presence: true
  validates :user_id, presence: true
  validates :user_rating, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
end
