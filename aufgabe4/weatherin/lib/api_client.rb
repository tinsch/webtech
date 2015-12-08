require 'net/http'
require 'uri'

class ApiClient

  def self.getweather(cityname)
    city = cityname.gsub(/\s+/, "")
    begin 
      uri = URI.parse("http://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{ENV['WEATHERAPI_KEY']}")
      response = Net::HTTP.get_response(uri) 
      response.body  
    rescue StandardError => e
      Rails.logger.error "An Error ocurred: #{e}"
      nil
    end 
  end
end
