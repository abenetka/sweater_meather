class Api::V1::FavoritesController < ApplicationController
  def create
    if params[:api_key]
      user.favorites.create(location: params[:location])
    else
      render json: {}, status: :unauthorized
    end
  end

  def index
    if params[:api_key]
      render json: FavoriteSerializer.new(user)
    else
      render json: {}, status: :unauthorized
    end
  end

  def destroy
    if params[:api_key]
      favorite = user.favorites.find_by(location: params[:location])
      favorite.destroy
      render json: favorite
    else
      render json: {}, status: :unauthorized
    end
  end


  private

  def user
    user = User.find_by(api_key: params[:api_key])
  end

end
