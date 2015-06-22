Given(/^I visit "([^"]*)"$/) do |route|
  visit route
end

Then(/^I should see the current temp$/) do
  temp = find("span#temp").text
  puts "Temp: #{temp}"
end
