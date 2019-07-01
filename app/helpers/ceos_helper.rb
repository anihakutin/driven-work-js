module CeosHelper
  def ceo_name_link(company)
    company.ceo.nil? ? link_to("Add CEO", new_ceo_path ) : link_to(company.ceo_name, ceo_path(company.ceo))
  end

  def admin_delete_ceo
    if logged_in? && current_user.admin?
      button_to("Delete Ceo", :ceo, :method => :delete)
    end
  end
end
