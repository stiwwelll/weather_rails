module WeatherService

  class Endpoint
    include HTTParty
    base_uri 'api.openweathermap.org/data'

    def initialize(city)
      api_key = Rails.application.secrets.weather_key
      @options = { query: { q: city, appid: api_key, units: "metric" } }
    end

    def city_query
      self.class.get('/2.5/forecast', @options)
    end
  end

end
