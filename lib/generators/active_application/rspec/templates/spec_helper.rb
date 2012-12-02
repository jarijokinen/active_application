require "rubygems"
require "spork"

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require "capybara/rails"
  require "capybara/rspec"
  require "database_cleaner"
  require "forgery"

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
  
  RSpec.configure do |config|
    config.use_transactional_fixtures = false
    config.infer_base_class_for_anonymous_controllers = false
    config.order = "random"
    config.fail_fast = true
    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.run_all_when_everything_filtered = true
    config.filter_run :focus

    config.before :each do
      DatabaseCleaner.start
    end

    config.after :each do
      DatabaseCleaner.clean
    end
  end
end

Spork.each_run do
  require "factory_girl_rails"
  FactoryGirl.reload
end
