require 'net/http'
require 'uri'

class ApiClient

  def self.getweather(cityname)
    uri = URI.parse("http://api.openweathermap.org/data/2.5/weather?q=#{cityname}&appid=#{ENV['WEATHERAPI_KEY']}")
    response = Net::HTTP.get_response(uri) 
    response.body   
  end
end
