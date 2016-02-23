class Alert
  def initialize(zipcode)
    @alerts = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/alerts/q/#{zipcode}.json")
  end

  def alert_type
    @alerts["alerts"][0]["type"]
  end

  def alert_description
    @alerts["alerts"][0]["description"]
  end

  def alert_date
    @alerts["alerts"][0]["date"]
  end

  def alert_expires
    @alerts["alerts"][0]["expires"]
  end

  def alert_message
    @alerts["alerts"][0]["message"]
  end
end
