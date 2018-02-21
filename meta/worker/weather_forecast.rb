require 'net/http'
require 'json'

class WeatherForecast
  def initialize
    @uri = URI('http://api.openweathermap.org/data/2.5/weather')
  end

  def forecast(city_name)
    params = { q: city_name, appid: 'ec071e1bd39ffdef16d016806d38c8c1', units: 'metric' }
    @uri.query = URI.encode_www_form(params)

    parse_result(Net::HTTP.get(@uri))
  end

  private

  def parse_result(response)
    JSON.parse(response)
  end
end
