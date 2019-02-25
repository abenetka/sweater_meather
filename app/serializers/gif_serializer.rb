class GifSerializer
  include FastJsonapi::ObjectSerializer
  set_id :object_id
  attributes :images, :copyright
  # attributes :time, :summary, :url, :copyright
  # attributes images: {:url, :summary, :time, :copyright}

  # attribute :images do |object|
  #   binding.pry
  #   {
  #     time: object[:time],
  #     summary: object[:summary],
  #     url: object.get_giphy_url,
  #
  #   }
  # end

end
