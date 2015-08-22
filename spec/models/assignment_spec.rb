require 'spec_helper'

describe Assignment do
  let(:user) { FactoryGirl.create(:user) }
  let(:topic) { FactoryGirl.create(:topic) }
  subject { FactoryGirl.create(:assignment, user: user, topic: topic) }

  it "should have the correct user" do
    expect(subject.user).to eql user
  end

  it "should have the correct topic" do
    expect(subject.topic).to eql topic
  end

  context "without a user" do
    let(:assignment) { FactoryGirl.build(:assignment, user: nil, topic: topic) }
    it "is not valid" do
      expect(assignment).to_not be_valid
    end
  end

  context "without a topic" do
    let(:assignment) { FactoryGirl.build(:assignment, user: user, topic: nil) }
    it "is not valid" do
      expect(assignment).to_not be_valid
    end
  end
end
