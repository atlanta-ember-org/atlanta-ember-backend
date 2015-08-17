require 'spec_helper'

describe Meetup do
  subject(:subject) { described_class }

  describe "::all_members", :vcr do
    let(:members) { subject.all_members }
    it 'returns a known member of the meetup' do
      names_string = members.reduce('') { |acc, res| acc += res['name'] }
      expect(names_string).to include('Patrick Dougall')
    end

    it 'has more than one page of members' do
      expect(members.length).to be > 200
    end
  end
end
