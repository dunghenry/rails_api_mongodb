class Api::Auth::AuthController < ApplicationController
  def login
    user = User.find_by(:username => params[:username])
    if user
      if user.authenticate(params[:password])
        token = self.generate_token(user.id.to_s, user.username, user.type.to_s)
        user.set(:token => token)
        render json: {msg: "Login successfully", user: user.as_json({:except => [:password_digest]})}, status: :ok
      else
        render json: {msg: "Incorrect password"}, status: :unprocessable_entity
      end
    else
      render json: {msg: "User not found"}, status: :unprocessable_entity
    end
  end
end
