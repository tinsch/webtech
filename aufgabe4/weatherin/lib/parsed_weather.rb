class ParsedWeather
  attr_reader :city, :temperature, :value

  def initialize(weather_json)
    hash = JSON.parse(weather_json)
    @city = hash["name"]
    @temperature = hash["main"]["temp"] - 273.15
    @value = hash["weather"][0]["description"]
  end
end
