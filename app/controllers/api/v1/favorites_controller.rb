class Api::V1::FavoritesController < ApplicationController
  def create
    if params[:api_key]
      user = User.find_by(api_key: params[:api_key])
      user.favorites.create(location: params[:location])
    else
      render json: {}, status: :unauthorized
    end
  end

  def index
    user = User.find_by(api_key: params[:api_key])
    render json: FavoriteSerializer.new(user)
  end
  # def index
  #   user = User.find_by(api_key: params[:api_key])
  #   binding.pry
  #   favorites = user.favorites
  #   favorite = FavoriteFacade.new(user.favorites).fav_current_weather
  #   render json: FavoriteSerializer.new(favorite)
  # end
end
