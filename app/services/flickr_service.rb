class FlickrService

  def get_photo_json(lat, long)
    response = conn.get("/services/rest/?method=flickr.photos.search&tags=outdoors%2Cscenic%2Cphotography%2Coutdoors&safe_search=1&lat=#{lat}&lon=#{long}&per_page=25&format=json&nojsoncallback=1&sort=date-taken-desc")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: "https://api.flickr.com") do |f|
      f.params["api_key"] = ENV["flickr_api_key"]
      f.adapter Faraday.default_adapter
    end
  end

end
