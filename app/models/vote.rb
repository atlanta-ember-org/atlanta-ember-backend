class Vote < ActiveRecord::Base
  belongs_to :topic

  enum valence: [:up, :down]
end
