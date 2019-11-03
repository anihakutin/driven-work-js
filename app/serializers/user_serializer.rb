class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::UrlHelper

  attributes :id, :name, :email, :level, :editLink
  has_many :companies
  has_many :ceos

  def level
    return "ADMIN" if self.object.admin?

    return "Just Another Human..."
  end

  def editLink
    edit_user_path(self.object) if self.object == current_user
  end
end
