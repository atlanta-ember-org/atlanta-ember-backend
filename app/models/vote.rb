class Vote < ActiveRecord::Base
  belongs_to :topic

  enum valence: [:down, :up]
end
