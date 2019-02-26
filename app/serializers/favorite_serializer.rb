class FavoriteSerializer
  include FastJsonapi::ObjectSerializer

  attribute :favorites do |object|
    object.favorites.map do |favorite|
      favorite_hash(favorite.location)
    end
  end


  def self.favorite_hash(location)
    favorite_hash = {}
    favorite_hash[:location] = location
    favorite_hash[:current_weather] = ForecastFacade.new(location).get_forecast.current_weather
    favorite_hash
  end
end
