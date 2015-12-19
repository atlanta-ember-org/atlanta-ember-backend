require 'spec_helper'

describe Session do
  subject(:session) { FactoryGirl.create(:session) }

  it { is_expected.to respond_to :user }
end
