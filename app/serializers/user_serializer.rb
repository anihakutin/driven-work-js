class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  has_many :companies
  has_many :ceos
end
