class Session < ActiveRecord::Base
  belongs_to :user
  before_create :create_token
  before_create :make_active

  attr_reader :new_token

  def token_valid?(matching_token)
    token_factory.new(matching_token).matches?(self.auth_token)
  end

  private

  def create_token
    @new_token = token_factory.new
    self.auth_token = @new_token.to_hash
  end

  def make_active
    user.sessions.where(active: true).each do |session|
      session.update_attributes(active: false)
    end
    self.active = true
  end

  def token_factory
    Auth::Token
  end
end
