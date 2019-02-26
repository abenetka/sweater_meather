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

   it 'doesnt posts city and api_key', :vcr do
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

end
