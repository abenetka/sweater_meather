require 'rails_helper'

describe Forecast do
  it "exist", :vcr do
    attributes =
          {
            :latitude=>"39.7392358",
            :longitude=>"-104.990251",
            :current_weather=>"current weather",
            :hourly_weather=>"hourly weather",
            :daily_weather=>"daily weather",
         }
    forecast = Forecast.new(attributes)
    expect(forecast).to be_a(Forecast)
  end

end
