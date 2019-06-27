class TechnologyBreakthrough < ApplicationRecord
  belongs_to :company

  def company_name
    self.company.name
  end

  def years_since
    DateTime.now.year - self.year
  end

  def user
    self.company.user
  end
end
