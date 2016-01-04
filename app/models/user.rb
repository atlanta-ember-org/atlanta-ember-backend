class User < ActiveRecord::Base

  has_many :assignments
  has_many :topics, through: :assignments
  has_many :sessions
  validates :password, confirmation: true
  validates_presence_of :password, :password_confirmation
  before_create :encrypt_password

  def full_name
    "#{first_name} #{last_name}"
  end

  def auth_token
    sessions.where(active: true).last.try(:auth_token)
  end

  def password_matches?(password)
    Auth::Password.new(password).matches?(self.password)
  end

  private

  def encrypt_password
    self.password = Auth::Password.new(self.password).to_s
  end
end
