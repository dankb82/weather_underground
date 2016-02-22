require './condition.rb'

puts "Enter a zipcode"
zipcode = gets.chomp

c = Conditions.new(zipcode)

puts "Location: #{c.location}"

puts "Current Temp (F): #{c.temperature}"
