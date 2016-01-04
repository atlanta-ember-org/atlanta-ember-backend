require 'spec_helper'

describe User do
  subject(:user) { FactoryGirl.create('user') }

  describe "#full_name" do
    it 'returns first name concatenated with last name' do
      expect(user.full_name).to eql 'Example User'
    end
  end

  context "with topics" do
    let!(:topic_1) {
      topic = FactoryGirl.create(:topic, name: 'topic_1')
      user.assignments.create(topic: topic)
      topic
    }
    let!(:topic_2) {
      topic = FactoryGirl.create(:topic, name: 'topic_2')
      user.assignments.create(topic: topic)
      topic
    }
    let!(:topic_3) {
      topic = FactoryGirl.create(:topic, name: 'topic_3')
      user.assignments.create(topic: topic)
      topic
    }

    it "can be assigned to many topics" do
      expect(user.topics.map(&:name)).to eql(['topic_1', 'topic_2', 'topic_3'])
    end
  end

  describe '#auth_token' do
    let!(:session) { FactoryGirl.create(:session, user: user) }
    subject(:auth_token) { user.auth_token }
    it { is_expected.to eq session.auth_token }

    context 'when there is no active auth token' do
      before do
        session.update_attributes(active: false)
      end

      it { is_expected.to be nil }
    end

    context 'when there is a newer session' do
      let!(:new_session) { FactoryGirl.create(:session, user: user) }
      it { is_expected.to eq new_session.auth_token }
    end
  end

  describe '#password_matches?(password)' do
    # subject { user.password_matches?(password) }
  end
end
