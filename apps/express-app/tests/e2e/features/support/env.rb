require "capybara"
require "capybara/cucumber"
require "capybara/poltergeist"
require "billy/cucumber"

# Register hooks
Before("@billy") do
  if ENV["MODE"] == "record" || ENV["MODE"] == "playback"
    Capybara.current_driver = :poltergeist_billy
  else
    puts "MODE not set to record or playback, not using billy!"
  end
end

# Reset driver at the end of every scenario
After do
  Capybara.use_default_driver
end

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :poltergeist
  config.app_host = "http://localhost:#{ENV['PORT']}"
end

if ENV["MODE"] == "record"
  # See https://github.com/oesmith/puffing-billy#caching
  Billy.configure do |c|
    c.cache = true
    c.persist_cache = true
    c.cache_path = "req_cache/"
    c.dynamic_jsonp = true # See http://dev.contractual.ly/testing-stripe-js-with-mocked-network/
    c.dynamic_jsonp_keys = %w(callback _) # and any other params that need to be ignored
  end
end

if ENV["MODE"] == "playback"
  Billy.configure do |c|
    c.cache = true
    c.persist_cache = false
    c.cache_path = "req_cache/"
    c.dynamic_jsonp = true # See http://dev.contractual.ly/testing-stripe-js-with-mocked-network/
    c.dynamic_jsonp_keys = %w(callback _) # and any other params that need to be ignored
  end
end
