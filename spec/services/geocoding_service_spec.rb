require 'rails_helper'

describe GeocodingService do
  it 'exists', :vcr do
    city = "Denver"
    state = "CO"
    service = GeocodingService.new(city, state)

    expect(service).to be_a(GeocodingService)
  end

  it 'returns latitude and longitude of location', :vcr do
    city = "Denver"
    state = "CO"
    latitude = "39.7392358"
    longitude = "-104.990251"

    service = GeocodingService.new(city, state)
    lat = service.get_latitude
    long = service.get_longitude

    expect(lat).to eq(latitude.to_f)
    expect(long).to eq(longitude.to_f)
  end

end
