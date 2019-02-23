require 'rails_helper'

describe "Location API" do
  it 'sends city and state' do
  location = create(:location, city: "Denver", state: "CO")

  get "/api/v1/forecast?location=#{location["city"]}, #{location["state"]}"

  expect(response).to be_successful

  location = JSON.parse(response.body)

  expect(location["city"]).to eq(location.city)
  expect(location["state"]).to eq(location.state)
  end
end
