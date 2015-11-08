class TopicSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :users, :score

  def users
    object.users.pluck(:id)
  end
end
