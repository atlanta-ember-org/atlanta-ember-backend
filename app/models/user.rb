class User < ActiveRecord::Base

  has_many :assignments
  has_many :topics, through: :assignments
  has_many :sessions

  def full_name
    "#{first_name} #{last_name}"
  end
end
