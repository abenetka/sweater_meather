class BackgroundSerializer
  include FastJsonapi::ObjectSerializer
  set_id :object_id
  attributes :latitude, :longitude, :city, :state
  #
  attribute :current_weather do |object|
    object.get_current_weather
  end
  #
  # attribute :hourly_weather do |object|
  #   object.get_hourly_weather
  # end
  #
  # attribute :daily_weather do |object|
  #   object.get_daily_weather
  # end
end
