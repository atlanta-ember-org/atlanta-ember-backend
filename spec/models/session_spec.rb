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

  describe '#active' do
    subject { session.active }
    it { is_expected.to be true }

    context 'when there is a previously active session' do
      let!(:previous_session) { FactoryGirl.create(:session, user: user) }
      let!(:current_session)  { FactoryGirl.create(:session, user: user) }

      it 'stays active' do
        expect(current_session.active).to be true
      end

      it 'is expected to make all other sessions for the user inactive' do
        expect(user.sessions.find(previous_session.id).active).to be false
      end
    end
  end
end
