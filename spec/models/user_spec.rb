require 'spec_helper'

describe User do
  subject(:subject) { FactoryGirl.create('user') }

  describe "#full_name" do
    it 'returns first name concatenated with last name' do
      expect(subject.full_name).to eql 'Example User'
    end
  end

end
