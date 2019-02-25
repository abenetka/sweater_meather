class GifSerializer < ActiveModel::Serializer

  # include FastJsonapi::ObjectSerializer
  # set_id :object_id
  attributes :images

  def images
    binding.pry
    object do|obj|
      {time: obj[:time],
        summary: obj[:summary],
        url: obj.get_giphy_url
      }
    end
  end

end
