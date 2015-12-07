require 'net/http'
require 'uri'

class ApiClient

  def self.getweather(cityname)
    city = cityname.gsub(/\s+/, "")
    uri = URI.parse("http://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{ENV['WEATHERAPI_KEY']}")
    response = Net::HTTP.get_response(uri) 
    response.body   
  end
end
