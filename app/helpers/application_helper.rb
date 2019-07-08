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

  def display_errors(object)
    errors = []
    errors << flash[:alert] if flash.any?

    if object.try(:errors) && object.errors.any? # fixme
      object.errors.full_messages.each do |msg|
        errors << " #{msg}"
      end
    end

    errors.join(",")
  end

  def logged_in_user_link
    link_to "Hello, #{current_user.name}", user_path(current_user), class: "navbar-brand" if logged_in?
  end

  def login_link
    link_to "Login or Sign Up", new_user_path if !logged_in?
  end

  def logout_link
    link_to "Log Out", logout_path, :method => :post if logged_in?
  end
end
