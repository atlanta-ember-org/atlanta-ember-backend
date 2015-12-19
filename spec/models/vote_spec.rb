require 'spec_helper'

describe Vote do
  subject(:vote) { FactoryGirl.create(:vote) }
  it { is_expected.to respond_to :topic }

  context 'with a valence' do
    subject(:vote) { FactoryGirl.create(:vote, valence: valence) }
    let(:valence) { 'up' }
    context 'when it is up' do
      it 'has an up valence' do
        expect(vote.valence).to eq 'up'
      end
    end
    context 'when it is down' do
      let(:valence) { 'down' }
      it 'has a down valence' do
        expect(vote.valence).to eq 'down'
      end
    end
  end
end
