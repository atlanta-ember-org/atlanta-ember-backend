require 'spec_helper'

describe EventSerializer do
  let(:event) { FactoryGirl.create(:event) }
  let!(:topic_1) { event.topics.create(name: 'first')}
  let!(:topic_2) { event.topics.create(name: 'second') }
  let!(:topic_3) { event.topics.create(name: 'third') }
  let(:event_serializer) { described_class.new(event) }
  subject { JSON.parse(event_serializer.to_json) }

  context "with many users" do
    let(:expected_json) {
      {"event"=>
        { "id"=> event.id,
          "meetup_id"=>"MyString",
          "serialized_venue"=>nil,
          "name"=>"MyString",
          "event_url"=>"MyString",
          "yes_rsvp_count"=>nil,
          "description"=>"MyText",
          "status"=>"MyString",
          "originally_created_at"=>"2015-09-01T20:25:03.000Z",
          "starts_at"=>"2015-09-01T20:25:03.000Z",
          "venue"=>nil,
          "topics" => [ topic_1.id, topic_2.id, topic_3.id ]
        }
      }
    }

    it { is_expected.to eql expected_json}
  end

end
