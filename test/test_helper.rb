ENV['RACK_ENV'] = 'test'
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
Dir[File.dirname(__FILE__) + '/support/*.rb'].each { |file| require file }
require 'securerandom'
require 'hubbub/automation'

require 'minitest/autorun'
require 'minitest/reporters'

require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'
require 'capybara-screenshot/minitest'

Capybara.configure do |config|
  config.run_server = false
  config.app_host = ENV['HOST_URL'] || 'https://qa1.hubbubhealth.com'
  config.ignore_hidden_elements = false
  config.default_max_wait_time = 30

  config.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, js_errors: false, timeout: 180, phantomjs_options: ['--load-images=no', '--ignore-ssl-errors=yes', '--ssl-protocol=any'])
  end
  config.javascript_driver = :poltergeist
  config.default_driver = :poltergeist
  config.save_path = ENV['CIRCLE_ARTIFACTS'] if ENV['CIRCLE_ARTIFACTS']
end

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
Minitest.after_run { puts "Completed on #{Capybara.app_host}" }

class Minitest::Test
  include Capybara::DSL
  include Capybara::Screenshot::MiniTestPlugin
  include WaitForAjax

  def setup
    page.driver.headers = { 'Accept-Language' => 'en' }
  end

  def teardown
    Capybara.use_default_driver
    Capybara.reset_sessions!
  end
end
