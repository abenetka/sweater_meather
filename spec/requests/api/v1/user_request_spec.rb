require 'rails_helper'

describe "Users API" do
  before {
    post '/api/v1/users',
     params:
     {email: "wanda@aol.com", password: "12345", password_confirmation: "12345"}
   }
   it 'sends user info', :vcr do
     expect(response).to be_successful
     result = JSON.parse(response.body, symbolize_names: true)[:data]
     expect(result).to have_key(:type)
     expect(result).to have_key(:id)
     expect(result[:attributes]).to have_key(:api_key)
   end
end
