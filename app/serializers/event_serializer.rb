class EventSerializer < ActiveModel::Serializer
  attributes :id, :meetup_id, :serialized_venue, :name, :event_url,
             :yes_rsvp_count, :description, :status, :originally_created_at,
             :starts_at, :venue, :topics

  def venue
    venue = object.venue
    return venue.id if venue
    return nil
  end

  def topics
    object.topics.pluck(:id)
  end
end
