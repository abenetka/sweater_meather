class ForecastFacade
  def initialize(location)
    @location = location
  end

  def get_forecast
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


end
