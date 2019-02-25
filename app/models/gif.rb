class Gif

  def initialize(attributes)
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

  def giphy_service
    @_giphy_service ||= GiphyService.new.get_giphy_json(summary)
  end

end
