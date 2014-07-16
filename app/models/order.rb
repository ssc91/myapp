class Order < ActiveRecord::Base
  attr_accessible :order_list, :restaurant_id, :status, :user_id

  belongs_to :customer
  belongs_to :restaurant
  has_many :items
  validates :user_id, presence: true
  validates :restaurant_id, presence: true
  validates :order_list, presence: true
end
