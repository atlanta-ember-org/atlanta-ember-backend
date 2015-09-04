class EventsSyncer

  def self.sync
    new.sync
  end

  def sync
    parsed_events.each do |parsed_event|
      find_by_params = meetup_id: parsed_event.meetup_id
      Event.find_or_create_by(find_by_params) do |event|
        event.update_attributes!(parsed_event.to_hash)
        event.save
      end
    end
  end

  private

  def parsed_events
    @parsed_events ||= LazyDoc::Collection.build(Meetup.all_events, Parsers::Event)
  end
end
