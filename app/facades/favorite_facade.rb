class FavoriteFacade
  def initialize(favorites)
    @favorites = favorites
    @location = location_finder
    binding.pry
  end

  def location_finder
    @favorites.map do |favorite|
      favorite.location.split(', ')
    end
  end

  def location
  #
  # def fav_current_weather
  #   binding.pry
  #   forecast = @favorites.map do |favorite|
  #     binding.pry
  #     favorite.location.get_forecast
  #   end

  # end@l

  # def fav_current_weather
  #   binding.pry
  #   forecast = @favorites.location.get_forecast
  #   # Favorite.new(forecast.current_weather)
  # end

  def get_forecast(location)
    Forecast.new(weather_service)
  end

  def split_location
    @location.split(', ')
  end

  def find_longitude
    location_service[:lng]
  end

  def find_latitude
    location_service[:lat]
  end

  def location_service
    @_location_service ||= GeocodingService.new.get_coordinates(split_location[0], split_location[1])
  end

  def weather_service
    @_weather_service ||= DarkSkyService.new.get_weather(find_latitude, find_longitude)
  end

#   forecast = ForecastFacade.new(params[:location]).get_forecast
# daily_weather = forecast.daily_weather
# giphy = GifFacade.new(daily_weather).get_giphy
# render json: GifSerializer.new(giphy)

end
