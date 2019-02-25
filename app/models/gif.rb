class Gif

  def initialize(daily_weather)
    @time = daily_weather[:time]
    @summary = giphy_summary(daily_weather[:summary])
    @url = get_giphy_url
  end

  def get_giphy
    giphy_service[:data].map do |raw_gif|
        Gif.new(raw_gif)
    end
  end

  def giphy_summary(summary)
    summary.gsub(" ","+")
  end

  def giphy_service
    @_giphy_service ||= GiphyService.new.get_giphy_json(@summary)
  end

  def get_giphy_url
    giphy_service[:data][0][:images][:downsized][:url]
  end

end
