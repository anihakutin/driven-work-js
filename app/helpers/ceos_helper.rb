module CeosHelper
  def ceo_name_link(company)
    company.ceo.nil? ? link_to("Add CEO", new_ceo_path ) : company.ceo_name
  end
end
