class Weather < ActiveRecord::Base
  attr_accessor :city, :value, :temperature

  def self.search(cityname)
    where({ city: cityname, created_at: (Time.now - 1.hour)..Time.now }).first
  end
end
