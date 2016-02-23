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

class Alert
  def initialize(zipcode)
    @zipcode = zipcode
    @alerts = JSON.parse(File.read("alerts.json"))
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
    s = Astronomy.new(27616)
    assert_equal "6:53", s.sunrise
    assert_equal "18:02", s.sunset
  end

  def test_alerts
    a = Alert.new(50301)
    assert_equal "FLO", a.alert_type
    assert_equal "Flood Warning", a.alert_description
    assert_equal "3:32 PM CST on February 22, 2016", a.alert_date
    assert_equal "6:00 AM CST on February 26, 2016", a.alert_expires
    assert_equal "\n...Flood Warning now in effect until Thursday morning...\n\nThe Flood Warning continues for\n the Des Moines River at Des Moines se 6th St...or from below the \n center street dam...to Runnells.\n* Until Thursday morning.\n* At 3:00 PM Monday the stage was 23.3 feet...or 0.7 feet below \n flood stage.\n* Flood stage is 24.0 feet.\n* No flooding is occurring and minor flooding is forecast.\n* Forecast...rise to flood stage late this evening. Continue rising \n to 24.3 feet...or 0.3 feet above flood stage...midday Tuesday. \n Then begin falling and go below flood stage Thursday morning.\n* Impact...at 24.0 feet...the bike trail is closed east of Water \n Street. Portions of other bike trails are also affected.\n\n\nLat...Lon 4159 9356 4152 9333 4145 9333 4154 9356\n 4159 9366 4159 9356 \n\n\n\n\n", a.alert_message
  end


end
