module Auth
  class TokenAuthenticator

    def self.authenticate(email, token)
      new(email, token).authenticate
    end

    def initialize(email, token, user_factory: User, token_factory: Token)
      @token = token_factory.new(token)
      @user = user_factory.find_by(email: email)
    end

    def authenticate
      if @user == nil
        status = false
      elsif @user.auth_token == nil
        status = false
      elsif @token.matches?(@user.auth_token) == false
        status = false
      else
        status = true
      end
      [@user, status]
    end
  end
end
