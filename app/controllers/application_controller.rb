class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session

  # before_filter :authenticate

  # def current_user
  #   @current_user
  # end

  # private

  # def authenticate
  #   email = 'some email'
  #   token = request.headers["WWW-Authenticate"]
  #   @current_user, status = Auth.authenticate(email: email, token: token)
  # end
end
