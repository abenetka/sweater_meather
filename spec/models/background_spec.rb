require "rails_helper"

describe Background do
  it 'exists', :vcr do
    attributes =
    {
      :id=>"39910698973",
      :secret=>"532368e033",
      :server=>"4912",
      :farm=>5,
      :title=>"Coors Field with Downtown Denver in background",
      :background_url=>"http://www.example.com"
    }
    background = Background.new(attributes)
    expect(background).to be_a(Background)
  end
  it 'can format a url', :vcr do
    attributes =
    {
      :id=>"39910698973",
      :secret=>"532368e033",
      :server=>"4912",
      :farm=>5,
      :title=>"Coors Field with Downtown Denver in background",
    }
    background = Background.new(attributes).formatted_background_url

    expect(background).to eq("https://farm#{attributes[:farm]}.staticflickr.com/#{attributes[:server]}/#{attributes[:id]}_#{attributes[:secret]}.jpg")
  end
end
