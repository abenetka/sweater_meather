class GifSerializer
  include FastJsonapi::ObjectSerializer
  set_id :object_id
# class GifSerializer < ActiveModel::Serializer
  attributes :url, :summary, :time
  # attributes :images
  #
  # def images
  #   binding.pry
  #   self.object do|obj|
  #     binding.pry
  #     # {time: obj[:time],
  #     #   summary: obj[:summary],
  #     #   url: obj.get_giphy_url
  #     # }
  #   end
  # end

  attribute :images do |object|
    binding.pry
    {
      time: object[:time],
      summary: object[:summary],
      url: object.get_giphy_url
    }
  end

end
