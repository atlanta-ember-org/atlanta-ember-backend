class SessionsController < ApplicationController

  def create
    user = User.find_by(email: session_params[:email])
    if user
      session = user.sessions.create
      render json: { email: user.email, token: session.new_token }
    else
      render nothing: true, status: :not_found
    end
  end

  private

  def session_params
    params.permit(:email, :password)
  end
end
