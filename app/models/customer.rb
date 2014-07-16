class Customer < ActiveRecord::Base
  attr_accessible :address, :email, :is_admin, :name, :phone, :password, :password_confirmation, :remember_token
  has_secure_password
  has_many :orders, foreign_key: "user_id"
  has_many :reviews, foreign_key: "user_id", dependent: :destroy
  has_many :ratings, foreign_key: "user_id", dependent: :destroy

  before_save { |customer| customer.email = email.downcase }
  before_save :create_remember_token
 

  validates :name,  presence: true, length: {maximum: 50}
  validates :phone,  presence: true, length: {is: 10}
  validates :address,  presence: true
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
