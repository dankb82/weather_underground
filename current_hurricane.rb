class CurrentHurricane
  def initialize(zipcode)
    @hurricane = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/currenthurricane/q/#{zipcode}.json")
  end
end
