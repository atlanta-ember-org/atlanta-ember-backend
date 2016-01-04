class User < ActiveRecord::Base

  has_many :assignments
  has_many :topics, through: :assignments
  has_many :sessions
  validates :password, confirmation: true
  validates_presence_of :password, :password_confirmation

  def full_name
    "#{first_name} #{last_name}"
  end

  def auth_token
    sessions.where(active: true).last.try(:auth_token)
  end
end
