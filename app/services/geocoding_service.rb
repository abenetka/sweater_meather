class GeocodingService
  def initialize(location)
    @location = location
  end


  def get_latitude
    get_json[:results].first[:geometry][:location][:lat]
  end

  def get_longitude
    get_json[:results].first[:geometry][:location][:lng]
  end


  private

  def get_json
    response = conn.get("/maps/api/geocode/json") do |f|
      f.params[:address] ="#{@location.city}, #{@location.state}"
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://maps.googleapis.com') do |faraday|
      faraday.params[:key] = ENV['google_maps_api_key']
      faraday.adapter Faraday.default_adapter
    end
  end

end
