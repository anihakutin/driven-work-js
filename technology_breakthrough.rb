class TechnologyBreakthrough < ApplicationRecord
  belongs_to :company

  validates :name, :description, :year, presence: true
  validates :year, numericality: { only_integer: true }
  validates :year, length: { is: 4 }

  def company_name
    self.company.name
  end

  def ceo_name
    return nil if !self.company.ceo
    self.company.ceo_name
  end

  def years_since
    DateTime.now.year - self.year
  end

  def user
    self.company.user
  end


  def self.count
    self.all.count
  end
end
