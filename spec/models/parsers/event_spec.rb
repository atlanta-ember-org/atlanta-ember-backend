require 'spec_helper'

describe Parsers::Event do
  let(:json) { File.read(Rails.root.join('spec', 'fixtures', 'events.json')) }
  let(:events) { LazyDoc::Collection.build(json, described_class) }

  it 'parses the json into a collection' do
    expect(events.count).to eql(12)
  end
  context 'a single event' do
    let(:event) { events.first }

    it 'has a venue address' do
      expect(event.venue.address_1).to eq "200 Arizona Ave NE #200"
    end

    it 'has an meetup_id' do
      expect(event.meetup_id).to eql('lchnflytmblb')
    end

    it 'has a name' do
      expect(event.name).to eql('September 2015: The Leaves and Ember are-a-changin\'')
    end

    it 'has a event_url' do
      expect(event.event_url).to eql('http://www.meetup.com/Ember-Atlanta-Meetup/events/224441763/')
    end

    it 'has a headcount' do
      expect(event.yes_rsvp_count).to eql(15)
    end

    it 'has a description' do
      expect(event.description).to eql("<p>We need folks to talk about things! It can be anything you think the community would find cool/useful. Topics could include:</p> <p><br/>• have a problem you need some help with<br/>• had an ah-ha moment about Ember<br/>• found a great tool on twitter<br/>• read a great article that helped you better understand a concept<br/>• found a great podcast you enjoy<br/>• saw a great conference talk online<br/>• know anything else that would be helpful for other group members to know</p> <p>Don't worry about if you're experienced with Ember or new to it - everyone has something they can share!</p>")
    end

    it 'has a status' do
      expect(event.status).to eql('upcoming')
    end

    it 'has an originally_created_at' do
      expect(event.originally_created_at).to be
    end

    it 'has a starts_at' do
      expect(event.starts_at).to be
    end

    describe '#to_hash' do
      it "provides data as a hash" do
        expect(event.to_hash.keys).to eql([:meetup_id, :originally_created_at, :starts_at, :yes_rsvp_count, :name, :event_url, :description, :status])
      end
    end
  end
end
