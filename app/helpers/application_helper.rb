module ApplicationHelper
# controller helpers ->>>

  def current_user
    user ||= User.find(session[:user_id]) unless session[:user_id].nil?
  end

  def logged_in?
    !current_user.nil?
  end

  def render_404
    raise ActionController::RoutingError.new('Not Found')
  end

  def require_login
    return head(:forbidden) unless logged_in?
  end

# link helpers ->>>

  def ceo_name_link(company)
    company.ceo.nil? ? link_to("Add CEO", new_ceo_path ) : company.ceo_name
  end

  def technology_breakthroughs_link(company)
    if company.technology_breakthroughs.empty?
      link_to("Add Technology Breakthrough", new_company_technology_breakthrough_path(company))
    else
       company.technology_breakthroughs_count
     end
  end

  def problems_solved_link(company)
    if company.problems.empty?
      link_to("Add Problem", new_company_problem_path(company))
    else
       company.problems_count
     end
  end

  def display_errors(object)
    if object.errors.any?
      object.errors.full_messages.each do |msg|
        content_tag(:div, content_tag(:li, msg ), class: "error_explanation")
      end
    end
  end
end
