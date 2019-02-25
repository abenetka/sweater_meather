class Forecast
  attr_reader :latitude,
              :longitude,
              :current_weather,
              :hourly_weather,
              :daily_weather

  def initialize(attributes)
    @latitude = attributes[:latitude]
    @longitude = attributes[:longitude]
    @current_weather = attributes[:currently]
    @hourly_weather = attributes[:hourly]
    @daily_weather = attributes[:daily]
  end

  def get_hourly_weather
    @hourly_weather[:data].map do |raw_hour|
      HourlyWeather.new(raw_hour)
    end
  end

  def get_daily_weather
    @daily_weather[:data].map do |raw_day|
      DailyWeather.new(raw_day)
    end
  end

  def get_current_weather
    CurrentWeather.new(@current_weather)
  end

end
