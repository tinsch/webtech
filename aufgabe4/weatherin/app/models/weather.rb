class Weather < ActiveRecord::Base
  validates :city, :value, :temperature, presence: true

  def self.search(cityname)
    where({ city: cityname, created_at: (Time.now - 1.hour)..Time.now }).first
  end
end
