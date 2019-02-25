class Flickr
  attr_reader :farm,
              :server,
              :id,
              :secret,
              :title

  def initialize(attributes)
    @farm = attributes[:farm]
    @server = attributes[:server]
    @id = attributes[:id]
    @secret = attributes[:secret]
    @title = attributes[:title]
  end
end
