class WeathersController < ApplicationController
  protect_from_forgery with: :exception

  def index
  end

  def get_weather_data
    @search_result = WeatherService::Endpoint.new(params[:city]).city_query
    respond_to :js
  end

end
