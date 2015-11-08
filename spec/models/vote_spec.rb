require 'spec_helper'

describe Vote do
  subject(:vote) { FactoryGirl.create(:vote) }
  it { is_expected.to respond_to :topic }
end
