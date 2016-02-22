require 'minitest/autorun'
require 'minitest/pride'
require 'HTTParty'
require './alerts.rb'
require './astronomy.rb'
require './conditions.rb'
require './current_hurricane.rb'
require './forecast.rb'
require './ten_day_forecast.rb'
# require 'execute'

class WeatherUnderground < Minitest::Test

  def test_classes_exist
    assert Alerts
    assert Astronomy
    assert Conditions
    assert CurrentHurricane
    assert Forecast
    assert TenDayForecast
  end
end
