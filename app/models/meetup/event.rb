module Meetup
  class Event
    def self.all
      new.all
    end

    def initialize(client: Meetup::Client)
      @client = client.new
    end

    def all
      @client.collect_all(events_path, events_params)
    end

    private

    def events_path
      '/2/events'
    end

    def events_params
      { group_id: MEETUP_GROUP_ID }
    end
  end
end
