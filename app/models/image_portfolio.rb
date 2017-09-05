class ImagePortfolio < ApplicationRecord
  validates :image, presence: true
  belongs_to :user
  belongs_to :stylist
end
