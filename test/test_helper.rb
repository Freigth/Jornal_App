require 'simplecov'

SimpleCov.start 'rails' do
  add_filter ['test', 'app/channels', 'app/helpers', 'app/jobs', 'app/mailers', 'app/controllers/errors_controller.rb', 'app/controllers/users', 'app/controllers/application_controller.rb']
end

# SimpleCov.start

ENV["RAILS_ENV"] ||= "test"

require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
