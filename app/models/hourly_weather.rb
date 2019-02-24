class HourlyWeather
  attr_reader :icon,
              :temperature,
              :time

  def initialize(attributes)
    @icon = attributes[:icon]
    @temperature = attributes[:temperature]
    @time = Time.at(attributes[:time])
  end


end
