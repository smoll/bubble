Feature: Weather
  In order to know the weather
  As a visitor
  I need see the weather on the landing page

@billy
Scenario: Current temp on the landing page
  Given I visit "/"
  Then I should see the current temp
