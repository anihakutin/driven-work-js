module CompaniesHelper
  def author_link(company)
    return link_to(company.user_name, company.user) if company.has_author?

    company.user_name
  end
end
