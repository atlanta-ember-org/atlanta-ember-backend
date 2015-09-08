class EventsSyncer

  def self.sync
    new.sync
  end

  def sync
    parsed_events.each do |parsed_event|
      parsed_venue = parsed_event.venue
      venue = Venue.find_or_create_by(uid: parsed_venue.uid)
      event = Event.find_or_create_by(meetup_id: parsed_event.meetup_id)
      venue.update_attributes!(parsed_venue.to_hash)
      event.update_attributes!(parsed_event.to_hash.merge(venue_id: venue.id))
    end
  end

  private

  def parsed_events
    @parsed_events ||= LazyDoc::Collection.build(Meetup.all_events, Parsers::Event)
  end
end
