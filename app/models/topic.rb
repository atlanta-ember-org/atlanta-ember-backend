class Topic < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_presence_of :name
  has_many :votes
  has_many :assignments
  has_many :users, through: :assignments
  belongs_to :event

  def score
    votes.where(valence: 1).count - votes.where(valence: 0).count
  end
end
