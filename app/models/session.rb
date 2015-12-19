class Session < ActiveRecord::Base
  belongs_to :user
  before_create :create_token

  private

  def create_token
    @token = Auth::Token.new
    self.auth_token = @token.to_hash
  end
end
