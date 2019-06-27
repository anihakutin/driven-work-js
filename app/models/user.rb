class User < ApplicationRecord
  require "base64"
  has_many :companies
  has_secure_password

  

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(email: auth_hash["email"]).first_or_create do |user|
      user.email = auth_hash["email"]
      user.name = auth_hash["name"]
      user.password = "passWord" # fixme
    end
  end
end
