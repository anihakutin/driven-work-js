class Company < ActiveRecord::Base
  has_many :problems
  has_many :technology_breakthroughs
  belongs_to :user
  belongs_to :ceo
end
