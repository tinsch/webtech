class WeathersController < ApplicationController

  def index
    if params[:search].present?
      if @weather = Weather.search(params[:search])
        flash[:notice] = "A saved weather has been found!"
      else 
      json = ApiClient.getweather(params[:search])
      parsed_weather = ParsedWeather.new(json)
      @weather = Weather.new
      @weather.update(city: parsed_weather.city, 
                      value: parsed_weather.value,
                      temperature: parsed_weather.temperature)
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def weather_params
      params.require(:weather).permit(:city)
    end
end
