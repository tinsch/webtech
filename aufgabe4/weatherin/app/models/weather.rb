class Weather < ActiveRecord::Base
  attr_accessor :city, :value, :temperature

  def self.search(search)
    where('city LIKE ?', "%#{search}").first
  end
end
