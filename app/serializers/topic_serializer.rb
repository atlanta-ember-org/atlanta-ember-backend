class TopicSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :users

  def users
    object.users.pluck(:id)
  end
end
