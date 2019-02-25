require 'rails_helper'

describe "Background API" do
  it 'returns photo based on weather', :vcr do
    location = "Denver, CO"

    get "/api/v1/backgrounds?location=#{location}"

    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)
    binding.pry
    expect(result[:data][:attributes]).to have_key(:latitude)
    expect(result[:data][:attributes]).to have_key(:longitude)
    expect(result[:data][:attributes]).to have_key(:city)
    expect(result[:data][:attributes]).to have_key(:state)
    expect(result[:data][:attributes]).to have_key(:flickr_url)
  end
end
