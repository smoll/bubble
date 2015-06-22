require "capybara"
require "capybara/cucumber"
require "capybara/poltergeist"

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :poltergeist
  config.app_host = "http://localhost:#{ENV['PORT']}"
end
