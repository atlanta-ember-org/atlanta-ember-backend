module Meetup

  def self.all_members
    Meetup::Member.all
  end

  def self.all_events
    Meetup::Event.all
  end
end
