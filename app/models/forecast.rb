class Forecast
  attr_reader :latitude, :longitude, :current_weather, :daily_weather, :hourly_weather, :city, :state
  def initialize(location)
    @location = location
    @city = split_location[0]
    @state = split_location[1]
    @latitude = find_latitude
    @longitude = find_longitude
    @current_weather = get_current_weather
    @hourly_weather = get_hourly_weather
    @daily_weather = get_daily_weather
  end

  def find_longitude
    location_service.get_coordinates[:lng]
  end

  def find_latitude
    location_service.get_coordinates[:lat]
  end


  def get_hourly_weather
    data = weather_service[:hourly][:data]
    data.map do |raw_hour|
      HourlyWeather.new(raw_hour)
    end
  end

  def get_daily_weather
    data = weather_service[:daily][:data]
    data.map do |raw_day|
      DailyWeather.new(raw_day)
    end
  end

  def get_current_weather
    data = weather_service[:currently]
    CurrentWeather.new(data)
  end

  def split_location
    @location.split(', ')
  end

  def location_service
    GeocodingService.new(@city, @state)
  end

  def weather_service
    DarkSkyService.new.get_weather(@latitude, @longitude)
  end

end
