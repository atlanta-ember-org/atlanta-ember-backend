require 'spec_helper'

describe User do
  subject(:subject) { FactoryGirl.create('user') }

  describe "#full_name" do
    it 'returns first name concatenated with last name' do
      expect(subject.full_name).to eql 'Example User'
    end
  end

  context "with topics" do
    let!(:topic_1) {
      topic = FactoryGirl.create(:topic, name: 'topic_1')
      subject.assignments.create(topic: topic)
      topic
    }
    let!(:topic_2) {
      topic = FactoryGirl.create(:topic, name: 'topic_2')
      subject.assignments.create(topic: topic)
      topic
    }
    let!(:topic_3) {
      topic = FactoryGirl.create(:topic, name: 'topic_3')
      subject.assignments.create(topic: topic)
      topic
    }

    it "can be assigned to many topics" do
      expect(subject.topics.map(&:name)).to eql(['topic_1', 'topic_2', 'topic_3'])
    end
  end
end
