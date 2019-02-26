class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.save
      user.api_key = SecureRandom.hex(10)
      user.save
      render json: UserSerializer.new(user)
    else
      render json: "You messed up"
    end
  end

 private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

end
