class Ceo < ActiveRecord::Base
  has_many :companies
  has_many :problems, through: :companies
  has_many :technology_breakthroughs, through: :companies
end
