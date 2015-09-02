class EventsSyncer

  def self.sync
    new.sync
  end

  def sync
    parsed_events.each do |parsed_event|
      Event.create!(parsed_event.to_hash)
    end
  end

  private

  def parsed_events
    @parsed_events ||= LazyDoc::Collection.build(Meetup.all_events, Parsers::Event)
  end
end
