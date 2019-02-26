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

   it 'doesnt send user info without correct info', :vcr do
     email = "wanda@aol.com"
     password = "12345"
     not_password = "wanda"
     post "/api/v1/users?email=#{email}&password=#{password}&password_confirmation=#{not_password}"

     expect(response).to be_successful
     expect(response.body).to eq("You messed up")
   end
end
