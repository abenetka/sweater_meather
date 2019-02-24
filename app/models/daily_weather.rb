class DailyWeather
  attr_reader :summary,
              :precipProbability,
              :precipType,
              :temperatureLow,
              :temperatureHigh,
              :date

  def initialize(attributes)
    @summary = attributes[:summary]
    @precipProbability = attributes[:precipProbability]
    @precipType = attributes[:precipType]
    @temperatureLow = attributes[:temperatureLow]
    @temperatureHigh = attributes[:temperatureHigh]
    @date = Time.at(attributes[:time]).strftime("%-m/%-d")
  end

end
