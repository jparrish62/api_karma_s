class UserSerializer < ActiveModel::Serializer
  attributes :id, :user_name, :email, :auth_token
  has_many :stylist
end
