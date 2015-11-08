require 'spec_helper'

describe TopicSerializer do
  let(:topic) { FactoryGirl.create(:topic) }
  let!(:user_1) {
    user = FactoryGirl.create(:user)
    topic.assignments.create(user: user)
    user
  }
  let!(:user_2) {
    user = FactoryGirl.create(:user)
    topic.assignments.create(user: user)
    user
  }
  let!(:user_3) {
    user = FactoryGirl.create(:user)
    topic.assignments.create(user: user)
    user
  }

  let(:topic_serializer) { described_class.new(topic) }
  subject { JSON.parse(topic_serializer.to_json) }

  context "with many users" do
    let(:expected_json) {
      { "topic"=> {
          "id"=> topic.id,
          "name"=>topic.name,
          "description"=>"MyString",
          "users"=> [user_1.id, user_2.id, user_3.id],
          "score"=> 0
        }
      }
    }

    it { is_expected.to eql expected_json}
  end

end
