# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
BencinasApi::Application.initialize!

Capybara.run_server = false
Capybara.current_driver = :webkit
Capybara.app_host = "http://www.bencinaenlinea.cl/web2/buscador.php?region=7"
