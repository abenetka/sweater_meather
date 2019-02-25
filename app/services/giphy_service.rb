class GiphyService

  def get_giphy_json(summary)
    response = conn.get("v1/gifs/search?q=#{summary}&limit=5&offset=0&rating=G&lang=en")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: "https://api.giphy.com") do |f|
      f.params["api_key"] = ENV["giphy_api_key"]
      f.adapter Faraday.default_adapter
    end
  end

end
