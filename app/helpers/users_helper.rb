module UsersHelper
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
