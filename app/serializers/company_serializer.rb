class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :numOfBreakthroughs
  belongs_to :user

  def numOfBreakthroughs
    self.object.technology_breakthroughs_count
  end
end
