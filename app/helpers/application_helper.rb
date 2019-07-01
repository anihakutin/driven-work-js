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
end
