class User < ApplicationRecord
  has_many :companies

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(email: auth_hash["email"]).first_or_create do |user|
      user.email = auth_hash["email"]
      user.name = auth_hash["name"]
    end
  end
end
