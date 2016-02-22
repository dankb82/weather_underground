require 'minitest/autorun'
require 'minitest/pride'
require 'json'
require './alert.rb'
require './astronomy.rb'
require './condition.rb'
require './current_hurricane.rb'
require './forecast.rb'
require './ten_day_forecast.rb'
# require 'execute'

class Condition
  def initialize(zipcode)
    @conditions = JSON.parse(File.read("conditions.json"))
  end
end

class WeatherUnderground < Minitest::Test

  def test_classes_exist
    assert Alert
    assert Astronomy
    assert Condition
    assert CurrentHurricane
    assert Forecast
    assert TenDayForecast
  end

  def test_current_conditions
    c = Condition.new(27616)
    assert_equal "Brentwood, NC", c.location
    assert_equal 50.9, c.temperature
  end
end
