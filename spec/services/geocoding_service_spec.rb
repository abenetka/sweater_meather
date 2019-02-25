require 'rails_helper'

describe GeocodingService do
  it 'exists', :vcr do
    city = "Denver"
    state = "CO"
    service = GeocodingService.new

    expect(service).to be_a(GeocodingService)
  end

  it 'returns latitude and longitude of location', :vcr do
    city = "Denver"
    state = "CO"
    latitude = "39.73924969999999"
    longitude = "-104.9902505"

    coordinates = GeocodingService.new.get_coordinates(latitude, longitude)
    lat = coordinates[:lat]
    long = coordinates[:lng]

    expect(lat).to eq(latitude.to_f)
    expect(long).to eq(longitude.to_f)
  end

end
