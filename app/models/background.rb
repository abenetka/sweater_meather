class Background

  def initialize(location)
    @location = location
    @city = split_location[0]
    @state = split_location[1]
    @latitude = find_latitude
    @longitude = find_longitude
    @background_url = formatted_background_url
  end

  def get_background_url
    data = flickr_service[:photos][:photo][0]
    Flickr.new(data)
  end

  def formatted_background_url
    results = get_background_url
    "https://farm#{results.farm}}.staticflickr.com/#{results.server}/#{results.id}_#{results.secret}.jpg"
  end

  # def find_longitude
  #   location_service.get_coordinates[:lng]
  # end
  #
  # def find_latitude
  #   location_service.get_coordinates[:lat]
  # end
  #
  # def split_location
  #   @location.split(', ')
  # end

  def flickr_service
    @_flickr_service ||= FlickrService.new.get_photo_json(@latitude, @longitude)
  end

  def location_service
     @_location_service ||= GeocodingService.new(@city, @state)
  end

end
