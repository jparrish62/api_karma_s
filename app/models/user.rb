class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :auth_token, uniqueness: true
  validates :user_name,  presence:   true
  has_many :image_portfolios
  has_many :stylist, dependent: :destroy
  has_many :appointments, dependent: :destroy
  before_create :generate_authentication_token!
  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end
end
