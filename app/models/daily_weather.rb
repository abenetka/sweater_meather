class DailyWeather
  attr_reader :summary,
              :precipProbability,
              :precipType,
              :temperatureLow,
              :temperatureHigh,
              :date,
              :dayofweek

  def initialize(attributes)
    @summary = attributes[:summary]
    @precipProbability = attributes[:precipProbability]
    @precipType = attributes[:precipType]
    @temperatureLow = attributes[:temperatureLow]
    @temperatureHigh = attributes[:temperatureHigh]
    @date = Time.at(attributes[:time]).strftime("%-m/%-d")
    @dayofweek = Time.at(attributes[:time]).strftime("%A")
  end

end
