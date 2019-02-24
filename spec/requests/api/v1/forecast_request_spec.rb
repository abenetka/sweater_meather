require 'rails_helper'

describe "Forecast API" do
  it 'sends city and state', :vcr do
    location = "Denver, CO"

    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result[:data][:attributes]).to have_key(:latitude)
    expect(result[:data][:attributes]).to have_key(:longitude)
    expect(result[:data][:attributes]).to have_key(:city)
    expect(result[:data][:attributes]).to have_key(:state)
    expect(result[:data][:attributes]).to have_key(:current_weather)
    expect(result[:data][:attributes]).to have_key(:daily_weather)
    expect(result[:data][:attributes]).to have_key(:hourly_weather)
  end

end
