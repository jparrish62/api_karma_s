class Stylist < ActiveRecord::Base
  has_many                          :image_portfolios
  has_many                          :appointments, dependent: :destroy
  validates                         :first_name, :email, :bio, presence: true
  belongs_to                        :user
end
