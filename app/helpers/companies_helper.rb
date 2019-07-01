module CompaniesHelper
  def author_link(company)
    return link_to(company.user_name, company.user) if company.has_author?

    company.user_name
  end

  def admin_delete_link
    if logged_in? && current_user.admin?
      button_to("Delete Company", :company, :method => :delete)
    end
  end
end
