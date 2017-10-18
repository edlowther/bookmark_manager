ENV['RACK_ENV'] = 'test'

require_relative '../app/app'
require_relative '../app/models/link'

require_relative '../spec/features/web_helper'

require 'capybara'
require 'capybara/rspec'
require 'database_cleaner'
require 'rspec'
require 'simplecov'
require 'simplecov-console'

Capybara.app = BookmarkManager

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end
