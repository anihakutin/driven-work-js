class Ceo < ApplicationRecord
  has_many :companies
  has_many :problems, through: :companies
  has_many :technology_breakthroughs, through: :companies

  validates :name, :year_born, :net_worth, presence: true
  validates :year_born, numericality: { only_integer: true }
  validates :year_born, length: { is: 4 }
  validates :net_worth, numericality: { only_integer: true }

  def technology_breakthroughs
    technology_breakthroughs.count
  end

  def problems_solved
    problems.solved.size
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
