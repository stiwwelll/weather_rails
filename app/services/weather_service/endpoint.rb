module WeatherService

  class Endpoint
    include HTTParty
    base_uri 'api.openweathermap.org/data'

    def initialize(lat, lng)
      api_key = Rails.env.production? ? Rails.application.secrets.weather_key : Rails.application.secrets_copy.weather_key
      @options = { query: { lat: lat, lon: lng, appid: api_key, units: "metric", cnt: "7" } }
    end

    def location_query
      self.class.get('/2.5/forecast/daily', @options)
    end
  end

end
