class DailyWeather
  attr_reader :summary,
              :precipProbability,
              :precipType,
              :temperatureLow,
              :temperatureHigh,
              :date,
              :dayofweek,
              :icon

  def initialize(attributes)
    binding.pry
    @summary = attributes[:summary]
    @precipProbability = attributes[:precipProbability]
    @precipType = attributes[:precipType]
    @temperatureLow = attributes[:temperatureLow]
    @temperatureHigh = attributes[:temperatureHigh]
    @date = Time.at(attributes[:time]).strftime("%-m/%-d")
    @dayofweek = Time.at(attributes[:time]).strftime("%A")
    @icon = attributes[:icon]
  end

end
