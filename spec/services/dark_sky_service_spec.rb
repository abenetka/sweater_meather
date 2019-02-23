require 'rails_helper'

describe DarkSkyService do
  it 'exists' do
    location = create(:location, city: "Denver", state: "CO")
    geo_service = GeocodingService.new(location)
    lat = geo_service.get_latitude
    long = geo_service.get_longitude
    weather_service = DarkSkyService.new

    weather = weather_service.get_weather(lat, long)

    expect(weather[:latitude]).to eq(lat.to_f)
    expect(weather[:longitude]).to eq(long.to_f)

    expect(weather).to have_key(:currently)
    expect(weather[:currently]).to have_key(:summary)
    expect(weather[:currently]).to have_key(:icon)
    expect(weather[:currently]).to have_key(:apparentTemperature)
    expect(weather[:currently]).to have_key(:uvIndex)
    expect(weather[:currently]).to have_key(:humidity)
    expect(weather[:currently]).to have_key(:temperature)
    expect(weather[:currently]).to have_key(:time)
    expect(weather[:currently]).to have_key(:visibility)

    expect(weather).to have_key(:daily)
    expect(weather[:daily]).to have_key(:summary)
    expect(weather[:daily]).to have_key(:data)
    expect(weather[:daily][:data].first).to have_key(:precipProbability)
    expect(weather[:daily][:data].first).to have_key(:summary)
    expect(weather[:daily][:data].first).to have_key(:precipType)
    expect(weather[:daily][:data].first).to have_key(:temperatureHigh)
    expect(weather[:daily][:data].first).to have_key(:temperatureLow)
    
    expect(weather).to have_key(:hourly)
    expect(weather[:hourly][:data].first).to have_key(:icon)
    expect(weather[:hourly][:data].first).to have_key(:temperature)
    expect(weather[:hourly][:data].first).to have_key(:time)
    expect(weather).to have_key(:timezone)
  end

end
