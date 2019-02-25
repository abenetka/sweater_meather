class Gif
  attr_reader :time,
              :summary,
              :url,
              :copyright,
              :images

  def initialize(daily_weather)
    @time = daily_weather[:time]
    @summary = daily_weather[:summary]
    @icon = giphy_search_term(daily_weather[:icon])
    @url = get_giphy_url
    @copyright = Time.at(daily_weather[:time]).strftime("%Y")
    @images = []
  end

  def giphy_search_term(icon)
    icon.gsub("-","+")
  end

  def get_giphy_url
    giphy_service[:data][0][:images][:downsized][:url]
  end

  def giphy_service
    @_giphy_service ||= GiphyService.new.get_giphy_json(@icon)
  end

  def images
    {
      time: @time,
      summary: @summary,
      url: @url
    }
  end


end
