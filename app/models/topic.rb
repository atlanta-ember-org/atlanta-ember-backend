class Topic < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_presence_of :name
  has_many :assignments
  has_many :users, through: :assignments
end
