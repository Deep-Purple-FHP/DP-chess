require 'rubygems'

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'spec_helper'
require 'rspec/rails'
# require 'factory_girl_rails'
# require 'shoulda/matchers'
# require 'capybara/rspec'
# require 'capybara/rails'
require 'pry'


Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end
