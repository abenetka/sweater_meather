class BackgroundFacade
  def initialize(location)
    @location = location
  end

  def get_photos
    location_service.
  end

  def find_longitude
    location_service.get_coordinates[:lng]
  end

  def find_latitude
    location_service.get_coordinates[:lat]
  end

  def location_service
    @_location_service ||= GeocodingService.new(@city, @state)
  end

  def flickr_service
    @_flickr_service ||= FlickrService.new.get_photo_json(@latitude, @longitude)
  end

end
