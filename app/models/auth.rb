module Auth

  def self.authenticate(email: email, token: token)
    if token
      status = TokenAuthenticator.authenticate(email, token)
    end
    return status
  end
end
