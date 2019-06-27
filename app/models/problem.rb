class Problem < ApplicationRecord
  belongs_to :company

  def company_name
    self.company.name
  end

  def years_ago_solved
    self.solved_status == "Solved" ? DateTime.now.year - self.year_solved : "Not Solved Yet"
  end

  def solved_status
    self.year_solved != 0 ? "Solved" : "Still at it..."
  end

  def user
    self.company.user
  end

  def user_name
    return "N/A" if self.user.nil?

    self.company.user.name
  end
end
