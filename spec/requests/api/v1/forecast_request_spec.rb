require 'rails_helper'

describe "Forecast API" do
  it 'sends city and state', :vcr do
    location = "Denver, CO"

    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result[:data][:attributes]).to have_key(:latitude)
    expect(result[:data][:attributes]).to have_key(:longitude)
    expect(result[:data][:attributes]).to have_key(:current_weather)
    expect(result[:data][:attributes]).to have_key(:daily_weather)
    expect(result[:data][:attributes]).to have_key(:hourly_weather)
    # expect to not be nil
  end

  it 'gets current weather', :vcr do
    location = "Denver, CO"

    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result[:data][:attributes]).to have_key(:current_weather)
    expect(result[:data][:attributes][:current_weather]).to have_key(:summary)
    expect(result[:data][:attributes][:current_weather]).to have_key(:icon)
    expect(result[:data][:attributes][:current_weather]).to have_key(:apparentTemperature)
    expect(result[:data][:attributes][:current_weather]).to have_key(:uvIndex)
    expect(result[:data][:attributes][:current_weather]).to have_key(:humidity)
    expect(result[:data][:attributes][:current_weather]).to have_key(:temperature)
    expect(result[:data][:attributes][:current_weather]).to have_key(:time)
    expect(result[:data][:attributes][:current_weather]).to have_key(:visibility)
    expect(result[:data][:attributes][:current_weather]).to have_key(:date)
  end

  it 'gets hourly weather', :vcr do
    location = "Denver, CO"

    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result[:data][:attributes]).to have_key(:hourly_weather)
    expect(result[:data][:attributes][:hourly_weather].first).to have_key(:icon)
    expect(result[:data][:attributes][:hourly_weather].first).to have_key(:temperature)
    expect(result[:data][:attributes][:hourly_weather].first).to have_key(:time)
  end

  it 'gets daily weather', :vcr do
    location = "Denver, CO"

    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result[:data][:attributes]).to have_key(:daily_weather)
    expect(result[:data][:attributes][:daily_weather].first).to have_key(:precipProbability)
    expect(result[:data][:attributes][:daily_weather].first).to have_key(:summary)
    expect(result[:data][:attributes][:daily_weather].first).to have_key(:precipType)
    expect(result[:data][:attributes][:daily_weather].first).to have_key(:temperatureHigh)
    expect(result[:data][:attributes][:daily_weather].first).to have_key(:temperatureLow)
    expect(result[:data][:attributes][:daily_weather].first).to have_key(:summary)
  end

end
