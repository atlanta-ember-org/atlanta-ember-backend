class Event < ActiveRecord::Base
  belongs_to :venue
  has_many :topics
end
