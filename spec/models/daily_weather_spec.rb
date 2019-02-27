require 'rails_helper'

describe DailyWeather do
  it "exists", :vcr do
    attributes =
    {
        :summary=>"Mostly cloudy throughout the day.",
        :precipProbability=>0.02,
        :precipType=>"snow",
        :temperatureLow=>21.73,
        :temperatureHigh=>44.22,
        :time=>1550991600
      }
    daily_weather = DailyWeather.new(attributes)
    expect(daily_weather).to be_a(DailyWeather)
    expect(daily_weather.summary).to eq("Mostly cloudy throughout the day.")
    expect(daily_weather.precipProbability).to eq(0.02)
    expect(daily_weather.precipType).to eq("snow")
    expect(daily_weather.temperatureLow).to eq(21.73)
    expect(daily_weather.temperatureHigh).to eq(44.22)
    expect(daily_weather.date).to eq("2/24")

  end

end
