class GifFacade
  def initialize(daily_weather)
    @daily_weather = daily_weather
  end

  def get_giphy
    @daily_weather[:data].map do |raw_day|
      Gif.new(raw_day)
    end
  end
  
end
