require 'rails_helper'

describe "Location API" do
  it 'sends city and state' do
  location = create(:location, city: "Denver", state: "CO")

  get "/api/v1/forecast?location=#{location["city"]}, #{location["state"]}"

  expect(response).to be_successful

  data = JSON.parse(response.body)

  expect(data[0]["city"]).to eq(location.city)
  expect(data[0]["state"]).to eq(location.state)
  end
end
