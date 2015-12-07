class WeathersController < ApplicationController

  def index
    if params[:search] && @weather = Weather.search(params[:search])
      flash[:notice] = "A saved weather has been found!"
    elsif params[:search]
      json = ApiClient.getweather(params[:search])
      parsed_weather = ParsedWeather.new(json)
      @weather = Weather.new
      @weather.update(city: parsed_weather.city, 
                      value: parsed_weather.value,
                      temperature: parsed_weather.temperature)
    else
      @weather = nil
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def weather_params
      params.require(:weather).permit(:city)
    end
end
