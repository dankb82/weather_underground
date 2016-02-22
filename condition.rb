class Condition
  def initialize(zipcode)
    @conditions = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/#{zipcode}.json")
  end
end
