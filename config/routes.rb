Rails.application.routes.draw do
  get 'weathers/index'
  root 'weathers#index'
  post 'weathers/get_weather_data'
end
