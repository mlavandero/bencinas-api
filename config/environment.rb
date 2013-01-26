# Load the rails application
require File.expand_path('../application', __FILE__)
require 'headless'

# Initialize the rails application
BencinasApi::Application.initialize!

Capybara.run_server = false
Capybara.current_driver = :webkit
Capybara.app_host = "http://www.bencinaenlinea.cl/web2/buscador.php?region=7"

# don't run on the local machine (since we don't have xvfb running locally)
if Rails.env.production?
    headless = Headless.new
    headless.start
end
