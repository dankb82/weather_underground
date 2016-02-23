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
    @zipcode = zipcode
    @conditions = JSON.parse(File.read("conditions.json"))
  end
end

class TenDayForecast
  def initialize(zipcode)
    @zipcode = zipcode
    @ten_day = JSON.parse(File.read("ten_day_forecast.json"))
  end
end

class Astronomy
  def initialize(zipcode)
    @zipcode = zipcode
    @astronomy = JSON.parse(File.read("astronomy.json"))
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

  def test_ten_day_forecast
    tdf = TenDayForecast.new(27616)
    assert_equal ["Monday", "Cloudy with rain. Lows overnight in the low 40s."], tdf.text_forecast[0]
    assert_equal ["Wednesday Night", "Cloudy with showers. Low around 40F. Winds light and variable. Chance of rain 60%."], tdf.text_forecast[-1]
  end

  def test_sunrise_and_sunset
    a = Astronomy.new(27616)
    assert_equal "6:53", a.sunrise
    assert_equal "18:02", a.sunset
  end
end
