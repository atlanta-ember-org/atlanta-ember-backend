require 'spec_helper'

describe Topic do
  let(:topic) { FactoryGirl.create(:topic) }

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
end
