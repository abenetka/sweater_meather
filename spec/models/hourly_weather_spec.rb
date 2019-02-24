require 'rails_helper'

describe HourlyWeather do
  it "has attributes", :vcr do
    attributes =
      {
        :icon=>"partly-cloudy-day",
        :temperature=>42.06,
        :time=>1550991600
      }
    hourly_weather = HourlyWeather.new(attributes)

    expect(hourly_weather.icon).to eq("partly-cloudy-day")
    expect(hourly_weather.temperature).to eq(42.06)
    expect(hourly_weather.time).to eq("2019-02-24 00:00:00 -0700")

  end

end
