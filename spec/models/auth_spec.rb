require 'spec_helper'
require_relative '../../app/models/auth'

describe Auth do
  let!(:user)  { FactoryGirl.create(:user) }
  let(:token) { session.new_token.to_s }
  let(:email) { user.email }
  let(:auth)  { described_class.authenticate(email: email, token: token) }

  describe 'status' do
    subject { auth.last }
    context 'when the user has a session' do
      let!(:session) { FactoryGirl.create(:session, user: user) }

      it 'returns the user' do
        expect(auth.first.id).to be user.id
      end
      it { is_expected.to be true }

      context 'when user is not found' do
        let!(:session) { FactoryGirl.create(:session, user: user) }
        let(:email) { 'wrong.email@exaple.com' }
        it { is_expected.to be false }
      end

      context 'when token does not match' do
        let(:token) { 'wrong token' }
        it { is_expected.to be false }
      end
    end

    context 'when user has no session' do
      let(:other_user)  { FactoryGirl.create(:user) }
      let!(:session) { FactoryGirl.create(:session, user: other_user) }

      it { is_expected.to be false }
    end
  end
end
