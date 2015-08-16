require 'spec_helper'

describe Meetup::Client do
  subject(:subject) { described_class }

  describe "::get_members" do
    let(:results) { JSON.parse(subject.get_members)['results'] }
    it 'returns members of the meetup' do
      names_string = results.reduce('') { |acc, res| acc += res['name'] }
      expect(names_string).to include('Patrick Dougall')
    end
  end

end
