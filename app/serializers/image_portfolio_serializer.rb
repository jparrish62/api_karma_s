class ImagePortfolioSerializer < ActiveModel::Serializer
  attributes :id, :tittle, :caption, :image
  has_one :stylist
  has_one :user
end
