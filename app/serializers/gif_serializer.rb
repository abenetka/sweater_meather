class GifSerializer
  include FastJsonapi::ObjectSerializer
  set_id :object_id
  # attributes :time, :summary, :url

  attribute :images do |obj|
    obj.time
    obj.summary
    obj.url
  end

end
