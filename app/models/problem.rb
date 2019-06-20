class Problem < ApplicationRecord
  belongs_to :company

  def company_name
    self.company.name
  end

  def years_ago_solved
    self.solved? ? DateTime.now.year - self.year_solved : "Not Solved Yet"
  end

  def solved?
    self.year_solved != 0
  end
end
