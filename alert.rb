class Alert
  def initialize(zipcode)
    @alerts = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/alerts/q/#{zipcode}.json")
  end

  def get_alerts

  end
end
