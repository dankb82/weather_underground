class TenDayForecast
  def initialize(zipcode)
    # @ten_day = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/forecast10day/q/#{zipcode}.json")
  end

  def text_forecast
    text_forecast = []
    @ten_day["forecast"]["txt_forecast"]["forecastday"].each do |n|
      day = n["title"]
      text = n["fcttext"]
      text_forecast << [day, text]
    end
    text_forecast
  end
end
