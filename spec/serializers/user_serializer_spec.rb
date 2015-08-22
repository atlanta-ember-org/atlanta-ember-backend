require 'spec_helper'

describe UserSerializer do
  let(:user) { FactoryGirl.create(:user) }
  let!(:topic_1) {
    topic = FactoryGirl.create(:topic)
    user.assignments.create(topic: topic)
    topic
  }
  let!(:topic_2) {
    topic = FactoryGirl.create(:topic)
    user.assignments.create(topic: topic)
    topic
  }
  let!(:topic_3) {
    topic = FactoryGirl.create(:topic)
    user.assignments.create(topic: topic)
    topic
  }
  let(:user_serializer) { described_class.new(user) }
  subject { JSON.parse(user_serializer.to_json) }

  context "with many topics" do
    let(:expected_json) {
      { "user"=> {
          "id"=> user.id,
          "first_name"=>"Example",
          "last_name"=>"User",
          "full_name"=>"Example User",
          "topics"=> [topic_1.id, topic_2.id, topic_3.id]
        }
      }
    }

    it { is_expected.to eql expected_json}
  end

end
