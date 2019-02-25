require 'rails_helper'

describe "Background API" do
  it 'returns photo based on weather', :vcr do
    location = "Denver, CO"

    get "/api/v1/backgrounds?location=#{location}"

    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result[:data]).to have_key(:id)
    expect(result[:data][:attributes]).to have_key(:title)
    expect(result[:data][:attributes]).to have_key(:background_url)
  end
end
