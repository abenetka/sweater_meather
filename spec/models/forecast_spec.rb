require 'rails_helper'

describe Forecast do
  it "exist" do
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
  xit '#get_hourly_weather' do
    attributes =
          {
            :latitude=>"39.7392358",
            :longitude=>"-104.990251",
            :current_weather=>"current weather",
            :hourly_weather=>"hourly weather",
            :daily_weather=>"daily weather",
         }
    forecast = Forecast.new(attributes)
    expect(forecast.get_hourly_weather).to be_a(Forecast)
  end
  xit '#get_daily_weather' do
    attributes =
          {
            :latitude=>"39.7392358",
            :longitude=>"-104.990251",
            :current_weather=>"current weather",
            :hourly_weather=>"hourly weather",
            :daily_weather=>"daily weather",
         }
    forecast = Forecast.new(attributes)
    expect(forecast.get_daily_weather).to be_a(Forecast)
  end
  xit '#get_current_weather' do
    attributes =
          {
            :latitude=>"39.7392358",
            :longitude=>"-104.990251",
            :current_weather=>"current weather",
            :hourly_weather=>"hourly weather",
            :daily_weather=>"daily weather",
         }
    forecast = Forecast.new(attributes)
    expect(forecast.get_current_weather).to be_a(Forecast)
  end
end
