class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      user.update(session_token: SecureRandom.urlsafe_base64)
      render json: { status: 'Logged in', user: user }
    else
      render json: { status: 'Error', message: 'Email or password incorrect' }, status: :unauthorized
    end
  end

  def destroy
    user = User.find_by(session_token: params[:session_token])
    if user
      user.update(session_token: nil)
      render json: { status: 'Logged out' }
    else
      render json: { status: 'Error', message: 'Invalid session' }, status: :unauthorized
    end
  end
end
