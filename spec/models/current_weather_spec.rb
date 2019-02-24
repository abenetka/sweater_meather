require 'rails_helper'

describe CurrentWeather do
  it "has attributes" do
    attributes =
          {
            :summary=>"Partly Cloudy",
            :icon=>"partly-cloudy-day",
            :apparentTemperature=>38.01,
            :uvIndex=>2,
            :humidity=>0.26,
            :temperature=>42.89,
            :time=>1550991600,
            :visibility=>10,

         }
    current_weather = CurrentWeather.new(attributes)

    expect(current_weather.summary).to eq("Partly Cloudy")
    expect(current_weather.icon).to eq("partly-cloudy-day")
    expect(current_weather.apparentTemperature).to eq(38.01)
    expect(current_weather.uvIndex).to eq(2)
    expect(current_weather.humidity).to eq(0.26)
    expect(current_weather.temperature).to eq(42.89)
    expect(current_weather.time).to eq("2019-02-24 00:00:00 -0700")
    expect(current_weather.visibility).to eq(10)
    expect(current_weather.date).to eq("2/24")

  end

end
