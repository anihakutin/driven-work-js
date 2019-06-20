class Ceo < ApplicationRecord
  has_many :companies
  has_many :problems, through: :companies
  has_many :technology_breakthroughs, through: :companies

  def technology_breakthroughs
    technology_breakthroughs.count
  end

  def problems_solved
    problems.where('year_solved != ?', 0).count
  end

  def age
    DateTime.now.year - self.year_born
  end

  def formatted_net_worth
    number_to_currency(self.net_worth)
  end

  def count_of_companies
    companies.count
  end

  def company_names
    companies.collect { |company| company.name }
  end
end
