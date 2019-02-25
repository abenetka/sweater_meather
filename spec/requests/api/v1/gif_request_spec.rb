require 'rails_helper'

describe "Gifs API" do
  it 'returns daily giphy based on weather', :vcr do
    location = "Denver, CO"

    get "/api/v1/gifs?location=#{location}"

    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)
    binding.pry
    expect(result[:data]).to have_key(:images)
    expect(result[:data][:attributes]).to have_key(:time)
    expect(result[:data][:attributes]).to have_key(:summary)
    expect(result[:data][:attributes]).to have_key(:url)
  end
end
