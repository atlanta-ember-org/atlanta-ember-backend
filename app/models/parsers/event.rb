module Parsers
  class Event
    include LazyDoc::DSL

    access :venue
    access :yes_rsvp_count
    access :id
    access :name
    access :event_url
    access :description
    access :created
    access :time
    access :status

    def initialize(json)
      lazily_embed(json)
    end

    def serialized_venue
      JSON.dump(venue)
    end

    def meetup_id
      id
    end

    def originally_created_at
      to_time(created)

    end

    def starts_at
      to_time(time);
    end

    def to_hash
      {
        meetup_id: meetup_id,
        originally_created_at: originally_created_at,
        starts_at: starts_at,
        serialized_venue: serialized_venue,
        yes_rsvp_count: yes_rsvp_count,
        name: name,
        event_url: event_url,
        description: description,
        status: status
      }
    end

    def to_time(int)
      Time.at(int / 1000)
    end
  end
end
