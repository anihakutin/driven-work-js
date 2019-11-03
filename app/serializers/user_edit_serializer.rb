class UserEditSerializer < ActiveModel::Serializer
  attributes :name, :email, :level

  def level
    return "ADMIN" if self.object.admin?

    return "Just Another Human..."
  end
end
