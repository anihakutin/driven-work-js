module ProblemsHelper
  def problems_solved_link(company)
    if company.problems.empty?
      "0"
    else
       company.problems_count
     end
  end
end
