class UserSerializer < ActiveModel::Serializer
  attributes :id, :user_name, :email, :auth_token, :role
  has_many :stylist
  has_many :image_portfolios
end
