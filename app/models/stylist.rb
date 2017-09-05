class Stylist < ActiveRecord::Base
  has_attached_file                 :image, styles: { medium: "300x300>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_many                          :image_portfolios
  has_many                          :appointments, dependent: :destroy
  validates                         :first_name, :email, :bio, presence: true
  belongs_to                        :user
end
