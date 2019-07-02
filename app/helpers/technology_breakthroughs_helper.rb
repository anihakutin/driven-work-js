module TechnologyBreakthroughsHelper
  def technology_breakthroughs_link(company)
    if company.technology_breakthroughs.empty?
      "0"
    else
       company.technology_breakthroughs_count
     end
  end
end
