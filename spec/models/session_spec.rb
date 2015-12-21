require 'spec_helper'

describe Session do
  let(:user) { FactoryGirl.create(:user) }
  subject(:session) { FactoryGirl.create(:session, user: user) }

  describe '#auth_token' do
    subject { session.auth_token }
    it { is_expected.not_to be nil }
  end

  describe '#token_valid?(matching_token)' do
    subject { session.token_valid?(matching_token) }

    context 'when token matches' do
      let(:matching_token) { session.new_token.to_s }
      it { is_expected.to be true }
    end

    context 'when token does not match' do
      let(:matching_token) { "wrong token" }
      it { is_expected.to be false }
    end
  end
end
