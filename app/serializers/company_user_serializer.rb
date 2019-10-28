class CompanyUserSerializer < ActiveModel::Serializer
  attributes :id, :name, :level

  def level
    current_user_level(self.object)
  end
end
