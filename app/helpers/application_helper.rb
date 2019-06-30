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
    errors = []
    errors << flash[:alert] if flash.any?

    if object.errors.any?
      object.errors.full_messages.each do |msg|
        errors << " #{msg}"
      end
    end

    errors.join(",")
  end

  def current_user_level(user)
    "ADMIN" if user.admin?

    "Just Another Human..."
  end

  def current_user_edit_link(user)
    link_to("Edit Profile", edit_user_path) if user == current_user
  end

  def current_user_delete_link(user)
    button_to("Delete Profile", @user, :method => :delete) if user == current_user
  end
end
