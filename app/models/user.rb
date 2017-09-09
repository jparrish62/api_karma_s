class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: [:user, :editor, :admin]
  after_initialize :set_default_role, :if => :new_record?
  validates :auth_token, uniqueness: true
  validates :user_name,  presence:   true
  has_many :image_portfolios
  has_many :stylist, dependent: :destroy
  has_many :appointments, dependent: :destroy
  before_create :generate_authentication_token!

  def set_default_role
    self.role ||= :user
  end

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end
end
