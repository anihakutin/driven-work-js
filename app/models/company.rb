class Company < ApplicationRecord
  has_many :problems
  has_many :technology_breakthroughs
  belongs_to :user
  belongs_to :ceo

  def technology_breakthroughs_count
    technology_breakthroughs.count
  end

  def problems_solved
    problems.where('year_solved != ?', 0).count
  end

  def age
    age_in_days = DateTime.now.to_date - self.year_founded
    years = age_in_days.to_i / 365
  end

  def ceo_name
    self.ceo.name
  end
end
