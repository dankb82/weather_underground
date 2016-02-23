class CurrentHurricane
  def initialize(zipcode)
    @hurricane = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/currenthurricane/q/#{zipcode}.json")
  end

  def current_hurricanes
    hurricanes = []
    @hurricane["currenthurricane"].each do |h|
      hurricanes << h["stormInfo"]["stormName_Nice"]
    end
    hurricanes
  end
end
