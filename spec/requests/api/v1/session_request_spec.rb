require 'rails_helper'

describe "Sessions API" do
   it 'starts session', :vcr do
     email = "wanda@aol.com"
     password = "12345"
     user = User.create(email: "wanda@aol.com", password: "12345", password_confirmation: "12345")

     post "/api/v1/sessions?email=#{email}&password=#{password}"

     expect(response).to be_successful
     result = JSON.parse(response.body, symbolize_names: true)[:data]

     expect(result).to have_key(:type)
     expect(result).to have_key(:id)
     expect(result[:attributes]).to have_key(:api_key)
   end

end
