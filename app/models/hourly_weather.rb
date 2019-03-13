class HourlyWeather
  attr_reader :icon,
              :temperature,
              :time

  def initialize(attributes)
    binding.pry
    @icon = attributes[:icon]
    @temperature = attributes[:temperature]
    @time = Time.at(attributes[:time]).strftime("%-a %I %p")
  end


end
