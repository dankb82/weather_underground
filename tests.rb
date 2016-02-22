require 'minitest/autorun'
require 'minitest/pride'
require 'HTTParty'
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
