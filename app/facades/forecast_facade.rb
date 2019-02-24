class ForecastFacade
  def initialize(location)
    @location = location
  end

  def location_service
    @_location_service ||= GeocodingService.new(@city, @state)
  end

  def weather_service
    @_weather_service ||= DarkSkyService.new.get_weather(@latitude, @longitude)
  end


  def find_longitude
    location_service.get_coordinates[:lng]
  end

  def find_latitude
    location_service.get_coordinates[:lat]
  end

  def get_current_weather
    weather_service[:currently]
  end

  def get_hourly_weather
    weather_service[:hourly]
  end

  def get_daily_weather
    weather_service[:daily]
  end

end
