require 'spec_helper'

describe Topic do
  subject(:topic) { FactoryGirl.create(:topic) }
  it { is_expected.to respond_to :event }
  it { is_expected.to respond_to :votes }

  describe '#score' do
    let!(:vote_1) { topic.votes.create(valence: 1) }
    let!(:vote_2) { topic.votes.create(valence: 1) }
    let!(:vote_3) { topic.votes.create(valence: 0) }

    it 'gives the total count of up and down votes' do
      expect(topic.score).to eq 1
    end
  end

  context "without a name value" do
    let(:other_topic) { FactoryGirl.build(:topic, name: nil) }

    it "is not valid without a name value" do
      expect(other_topic).to_not be_valid
    end
  end

  context "with a duplicate name value" do
    let(:other_topic) { FactoryGirl.build(:topic, name: topic.name) }

    it "does not allow duplicate name values" do
      expect(other_topic).to_not be_valid
    end
  end

  context "with users" do
    let!(:user_1) {
      user = FactoryGirl.create(:user, first_name: 'user_1')
      topic.assignments.create(user: user)
      user
    }
    let!(:user_2) {
      user = FactoryGirl.create(:user, first_name: 'user_2')
      topic.assignments.create(user: user)
      user
    }
    let!(:user_3) {
      user = FactoryGirl.create(:user, first_name: 'user_3')
      topic.assignments.create(user: user)
      user
    }

    it "can be assigned to many users" do
      expect(topic.users.map(&:first_name)).to eql(['user_1', 'user_2', 'user_3'])
    end
  end
end
