class Item < ActiveRecord::Base
  attr_accessible :item_name, :item_price, :restaurant_id

  belongs_to :restaurant
  validates :item_name, presence: true, length: {maximum: 100, minimum: 3}
  validates :restaurant_id, presence: true
  validates :item_price, presence: true, numericality: {only_integer: true, greater_than: 0}
end
