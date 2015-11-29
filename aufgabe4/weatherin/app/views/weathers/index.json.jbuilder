json.array!(@weathers) do |weather|
  json.extract! weather, :id, :city, :temperature, :value
  json.url weather_url(weather, format: :json)
end
