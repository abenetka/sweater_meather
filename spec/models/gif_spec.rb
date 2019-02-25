require 'rails_helper'

describe Gif do
  it 'exists', :vcr do
    attributes =
    {
      :time=>1550991600,
      :summary=>"Mostly cloudy throughout the day.",
      :icon=>"partly-cloudy-day",
      :url=>"https://media3.giphy.com/media/aQ7kognlRPDzi/giphy-downsized.gif"
    }
    gif = Gif.new(attributes)
    expect(gif).to be_a(Gif)
  end
  it 'can format a url', :vcr do
    attributes =
    {
      :time=>1550991600,
      :summary=>"Mostly cloudy throughout the day.",
      :icon=>"partly-cloudy-day",
      :url=>"https://media3.giphy.com/media/aQ7kognlRPDzi/giphy-downsized.gif"
    }
    gif = Gif.new(attributes).get_giphy_url

    expect(gif).to eq("https://media3.giphy.com/media/aQ7kognlRPDzi/giphy-downsized.gif")
  end
end
