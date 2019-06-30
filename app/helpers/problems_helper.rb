module ProblemsHelper
  def problems_solved_link(company)
    if company.problems.empty?
      link_to("Add Problem", new_company_problem_path(company))
    else
       company.problems_count
     end
  end
end
