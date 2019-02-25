require 'rails_helper'

describe "Gifs API" do
  it 'returns daily giphy based on weather', :vcr do
    location = "Denver, CO"

    get "/api/v1/gifs?location=#{location}"
    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result[:data][0]).to have_key(:type)
    expect(result[:data][0][:type]).to eq("gif")
    expect(result[:data][0][:attributes]).to have_key(:images)
    expect(result[:data][0][:attributes][:images]).to have_key(:time)
    expect(result[:data][0][:attributes][:images]).to have_key(:summary)
    expect(result[:data][0][:attributes][:images]).to have_key(:url)
  end

end
