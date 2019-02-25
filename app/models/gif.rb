class Gif

  def initialize(daily_weather)
    binding.pry

  end
  
  def get_giphy
    giphy_service[:data].map do |raw_gif|
        Gif.new(raw_gif)
    end
  end

  # def summary
  #      summary = @daily_weather[:data].map do |day|
  #       day[:summary]
  #   end
  #     summary.gsub('', '+')
  #   end

    def giphy_service
      @_giphy_service ||= GiphyService.new.get_giphy_json(summary)
    end

  # attr_reader :farm,
  #             :server,
  #             :id,
  #             :secret,
  #             :title,
  #             :background_url
  #
  # def initialize(attributes)
  #   @farm = attributes[:farm]
  #   @server = attributes[:server]
  #   @id = attributes[:id]
  #   @secret = attributes[:secret]
  #   @title = attributes[:title]
  #   @background_url = formatted_background_url
  # end
  #
  # def formatted_background_url
  #   "https://farm#{@farm}.staticflickr.com/#{@server}/#{@id}_#{@secret}.jpg"
  # end


end
