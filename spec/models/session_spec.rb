require 'spec_helper'

describe Session do
  subject(:session) { FactoryGirl.create(:session) }

  it { is_expected.to respond_to :user }

  describe '#auth_token' do
    subject { session.auth_token }
    it { is_expected.not_to be nil }
  end
end
