require "allure-cucumber"
require "capybara"
require "capybara/cucumber"
require "faker"

CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENV["CONFIG"]}"))
# BROWSER = ENV["BROWSER"]

# if BROWSER == "firefox"
#   @driver = :selenium 

# elsif BROWSER == "fire_headless"
#   @driver = :selenium_chrome_headless

# elsif BROWSER == "chrome"
#   @driver = :selenium_chrome

# else 
# @driver = :selenium_chrome_headless
# end 

case ENV["BROWSER"]
when "firefox"
  @driver = :selenium
when "chrome"
  @driver = :selenium_chrome
when "fire_headless"
  @driver = :selenium_headless
when "chrome_headless"
  @driver = :selenium_chrome_headless
else 
  raise "Navegador incorreto"
end 

Capybara.configure do |config|
  config.default_driver = @driver
  # selenium_firefox_headless
  config.default_max_wait_time = 10
  config.app_host = CONFIG["url"]
end

AllureCucumber.configure do |config|
    config.results_directory = "/logs"
    config.clean_results_directory = true  
end 