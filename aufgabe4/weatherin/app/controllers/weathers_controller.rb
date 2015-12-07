class WeathersController < ApplicationController

  def index
    @weathers = Weather.all
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def weather_params
      params.require(:weather).permit(:city)
    end
end
