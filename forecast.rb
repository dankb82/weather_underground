class Forecast
  def initialize(zipcode)
    @forecast = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/forecast/q/#{zipcode}.json")
  end
end
