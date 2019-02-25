class BackgroundFacade
  def initialize(location)
    @location = location
  end

  def get_background
    data = flickr_service[:photos][:photo][0]
    Background.new(data)
  end

  def find_longitude
    location_service.get_coordinates[:lng]
  end

  def find_latitude
    location_service.get_coordinates[:lat]
  end

  def split_location
    @location.split(', ')
  end

  def location_service
    @_location_service ||= GeocodingService.new(split_location[0], split_location[1])
  end

  def flickr_service
    lat = find_latitude
    long = find_longitude
    @_flickr_service ||= FlickrService.new.get_photo_json(lat, long)
  end

end
