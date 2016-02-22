class Astronomy
  def initialize(zipcode)
    @astronomy = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/astronomy/q/#{zipcode}.json")
  end
end
