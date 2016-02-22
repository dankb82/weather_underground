class TenDayForecast
  def initialize(zipcode)
    @ten_day = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/forecast10day/q/#{zipcode}.json")
  end
end
