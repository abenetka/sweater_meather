class Forecast
  attr_reader :city, :state, :latitude, :longitude
  def initialize(location)
    @location = location
    @city = split_location[0]
    @state = split_location[1]
    @latitude = find_latitude
    @longitude = find_longitude
  end

  def split_location
    @location.split(', ')
  end

  def find_longitude
    GeocodingService.new(@city, @state).get_longitude
  end

  def find_latitude
    GeocodingService.new(@city, @state).get_latitude
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

  def weather_service
    DarkSkyService.new.get_weather(@latitude, @longitude)
  end


end
