class Api::V1::BackgroundsController < ApplicationController
  def index
    background = BackgroundFacade.new(params[:location])
    render json: BackgroundSerialize.new(background.get_photos)
  end
end
