require 'rails_helper'

describe "Favorites API" do
   it 'posts city and api_key', :vcr do
     email = "wanda@aol.com"
     password = "12345"
     post "/api/v1/users?email=#{email}&password=#{password}&password_confirmation=#{password}"
     result = JSON.parse(response.body, symbolize_names: true)[:data]
     expect(result).to have_key(:type)
     expect(result).to have_key(:id)
     api_key = result[:attributes][:api_key]
     location = "Denver, CO"
     post "/api/v1/favorites?location=#{location}&api_key=#{api_key}"

     expect(response).to be_successful
   end

   it 'doesnt post city and api_key', :vcr do
     email = "wanda@aol.com"
     password = "12345"
     post "/api/v1/users?email=#{email}&password=#{password}&password_confirmation=#{password}"
     result = JSON.parse(response.body, symbolize_names: true)[:data]
     expect(result).to have_key(:type)
     expect(result).to have_key(:id)

     location = "Denver, CO"
     post "/api/v1/favorites?location=#{location}"

     expect(response).to_not be_successful
     expect(status).to eq(401)
   end

   it 'gets a list of favorite location', :vcr do
     email = "wanda@aol.com"
     password = "12345"
     post "/api/v1/users?email=#{email}&password=#{password}&password_confirmation=#{password}"
     result = JSON.parse(response.body, symbolize_names: true)[:data]

     api_key = result[:attributes][:api_key]
     location = "Denver, CO"
     post "/api/v1/favorites?location=#{location}&api_key=#{api_key}"
     location_1 = "Denver, CO"
     location_2 = "Chicago, IL"
     post "/api/v1/favorites?location=#{location_1}&api_key=#{api_key}"
     post "/api/v1/favorites?location=#{location_2}&api_key=#{api_key}"

     get "/api/v1/favorites?api_key=#{api_key}"
     result = JSON.parse(response.body, symbolize_names: true)

     expect(response).to be_successful
     expect(status).to eq(200)
     expect(result[:data][:type]).to eq("favorite")
     expect(result[:data][:attributes]).to have_key(:favorites)
     expect(result[:data][:attributes][:favorites].first).to have_key(:location)
     expect(result[:data][:attributes][:favorites].first).to have_key(:current_weather)
     expect(result[:data][:attributes][:favorites].first[:current_weather]).to have_key(:time)
     expect(result[:data][:attributes][:favorites].first[:current_weather]).to have_key(:summary)
     expect(result[:data][:attributes][:favorites].first[:current_weather]).to have_key(:icon)
     expect(result[:data][:attributes][:favorites].first[:current_weather]).to have_key(:temperature)
   end

   it 'wont list favorite locations without api_key', :vcr do
     email = "wanda@aol.com"
     password = "12345"
     post "/api/v1/users?email=#{email}&password=#{password}&password_confirmation=#{password}"
     result = JSON.parse(response.body, symbolize_names: true)[:data]

     api_key = result[:attributes][:api_key]
     location = "Denver, CO"
     post "/api/v1/favorites?location=#{location}&api_key=#{api_key}"
     location_1 = "Denver, CO"
     location_2 = "Chicago, IL"
     post "/api/v1/favorites?location=#{location_1}&api_key=#{api_key}"
     post "/api/v1/favorites?location=#{location_2}&api_key=#{api_key}"

     get "/api/v1/favorites?"
     result = JSON.parse(response.body, symbolize_names: true)

     expect(response).to_not be_successful
     expect(status).to eq(401)
   end
   it 'deletes a favorite location', :vcr do
     email = "wanda@aol.com"
     password = "12345"
     post "/api/v1/users?email=#{email}&password=#{password}&password_confirmation=#{password}"
     result = JSON.parse(response.body, symbolize_names: true)[:data]

     api_key = result[:attributes][:api_key]
     location = "Denver, CO"
     post "/api/v1/favorites?location=#{location}&api_key=#{api_key}"
     location_1 = "Denver, CO"
     location_2 = "Chicago, IL"
     post "/api/v1/favorites?location=#{location_1}&api_key=#{api_key}"
     post "/api/v1/favorites?location=#{location_2}&api_key=#{api_key}"

     delete "/api/v1/favorites?location=#{location}&api_key=#{api_key}"
     result = JSON.parse(response.body, symbolize_names: true)

     expect(response).to be_successful
     expect(status).to eq(200)
     expect(result).to have_key(:id)
     expect(result).to have_key(:location)
     expect(result).to have_key(:user_id)
   end

   it 'wont delete location without api key' do
     email = "wanda@aol.com"
     password = "12345"
     post "/api/v1/users?email=#{email}&password=#{password}&password_confirmation=#{password}"
     result = JSON.parse(response.body, symbolize_names: true)[:data]

     api_key = result[:attributes][:api_key]
     location = "Denver, CO"
     post "/api/v1/favorites?location=#{location}&api_key=#{api_key}"
     location_1 = "Denver, CO"
     location_2 = "Chicago, IL"
     post "/api/v1/favorites?location=#{location_1}&api_key=#{api_key}"
     post "/api/v1/favorites?location=#{location_2}&api_key=#{api_key}"

     delete "/api/v1/favorites?location=#{location}"
     result = JSON.parse(response.body, symbolize_names: true)

     expect(response).to_not be_successful
     expect(status).to eq(401)
   end
end
