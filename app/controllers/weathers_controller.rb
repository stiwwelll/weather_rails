class WeathersController < ApplicationController
  protect_from_forgery with: :exception

  def index
  end

  def get_weather_data
    search_result = WeatherService::Endpoint.new(params[:lat], params[:lng]).location_query
    @query = JSON.parse(search_result.body)
    respond_to :html, :js
  end
end
