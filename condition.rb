# require 'httparty'

class Condition
  def initialize(zipcode)
    @conditions = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/#{zipcode}.json")
  end

  def temperature
    @conditions["current_observation"]["temp_f"]

  end

  def location
    @conditions["current_observation"]["display_location"]["full"]
  end
end
