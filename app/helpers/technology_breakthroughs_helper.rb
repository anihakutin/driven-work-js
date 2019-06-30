module TechnologyBreakthroughsHelper
  def technology_breakthroughs_link(company)
    if company.technology_breakthroughs.empty?
      link_to("Add Technology Breakthrough", new_company_technology_breakthrough_path(company))
    else
       company.technology_breakthroughs_count
     end
  end
end
