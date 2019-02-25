class Api::V1::GifsController < ApplicationController
  def index
    giphy = Gif.new(params[:location])
    render json: GifSerializer.new(giphy)
  end
end
