class Company < ApplicationRecord
  has_many :problems
  has_many :technology_breakthroughs
  belongs_to :user
  belongs_to :ceo, optional: true

  validates :name, :description, :year_founded, presence: true
  validates :year_founded, numericality: { only_integer: true }
  validates :year_founded, length: { is: 4 }

  accepts_nested_attributes_for :problems, :technology_breakthroughs

  def technology_breakthroughs_count
    technology_breakthroughs.count
  end

  def problems_solved
    problems.where('year_solved != ?', 0).count
  end

  def problems_count
    problems.count
  end

  def age
    DateTime.now.year - self.year_founded
  end

  def ceo_name
    self.ceo.name
  end

  def user_name
    return "N/A" if self.user.nil?

    self.user.name
  end
end
