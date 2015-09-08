class VenueSerializer < ActiveModel::Serializer
  attributes :id, :country, :city, :address_1, :name, :lon,
             :lat, :repinned

  def topics
    object.topics.pluck(:id)
  end
end
