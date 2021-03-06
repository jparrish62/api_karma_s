class StylistSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :bio, :profile_pic
  has_one    :user
  has_many   :image_portfolios
end
