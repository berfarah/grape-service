ENV['RACK_ENV'] ||= 'test'

require 'rack/test'
require 'simplecov'
SimpleCov.start { add_filter '_spec' }

# Load in environment
require File.expand_path('../../config/environment', __FILE__)

RSpec.configure do |config|
  config.expect_with :rspec
  config.raise_errors_for_deprecations!
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
