require 'rails_helper'

describe "Users API" do
   it 'sends user info', :vcr do
     email = "wanda@aol.com"
     password = "12345"
     post "/api/v1/users?email=#{email}&password=#{password}&password_confirmation=#{password}"

     expect(response).to be_successful
     result = JSON.parse(response.body, symbolize_names: true)[:data]
     expect(result).to have_key(:type)
     expect(result).to have_key(:id)
     expect(result[:attributes]).to have_key(:api_key)
   end
end
