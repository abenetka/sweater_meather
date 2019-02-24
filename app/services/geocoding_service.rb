class GeocodingService
  def initialize(city, state)
    @city = city
    @state = state
  end

  def get_coordinates
    get_json("/maps/api/geocode/json")
  end

  def get_latitude
    get_coordinates[:results].first[:geometry][:location][:lat]
  end

  def get_longitude
    get_coordinates[:results].first[:geometry][:location][:lng]
  end

  private

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://maps.googleapis.com') do |faraday|
      faraday.params[:key] = ENV['google_maps_api_key']
      faraday.params[:address] = "#{@city}, #{@state}"
      faraday.adapter Faraday.default_adapter
    end
  end

end
