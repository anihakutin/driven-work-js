class TechnologyBreakthrough < ApplicationRecordx
  belongs_to :company

  def company_name
    self.company.name
  end

  def years_ago_solved
    self.solved? ? DateTime.now.year - self.year : "Not Solved Yet"
  end

  def solved?
    self.year != 0
  end
end
