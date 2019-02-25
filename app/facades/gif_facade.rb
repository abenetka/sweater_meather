class GifFacade
  def initialize(daily_weather)
    @daily_weather = daily_weather
  end

  def get_giphy
    @daily_weather[:data].map do |raw_day|
      Gif.new(raw_day)
    end
    # giphy_service[:data].map do |raw_gif|
    #   Gif.new(raw_gif)
    # end
  end
  #
  # def summary
  #    summary = @daily_weather[:data].map do |day|
  #     day[:summary]
  #   end
  #   binding.pry
  #   summary.gsub('', '+')
  # end
  #
  # def giphy_service
  #   @_giphy_service ||= GiphyService.new.get_giphy_json(summary)
  # end


end
