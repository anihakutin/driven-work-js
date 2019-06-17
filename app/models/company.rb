class Company < ActiveRecord::Base
  has_one :ceo
  has_many :problems
  has_many :technology_breakthroughs
  belongs_to :user
end
