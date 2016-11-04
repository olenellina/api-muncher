require 'simplecov'
SimpleCov.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'vcr'
require 'webmock/minitest'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  Minitest::Reporters.use!

  # Add more helper methods to be used by all tests here...

  VCR.configure do |config|
    # If something changes with your API, delete the files that are stored here
    # Otherwise, tests will keep using what is stored in cassettes
    # Essentially this is a fixtures folder
    config.cassette_library_dir = 'test/cassettes' # folder where casettes will be located
    # Webmock is the middleperson between our code and the internet (pretends to be the internet)
    config.hook_into :webmock # tie into this other tool called webmock
    config.default_cassette_options = {
      :record => :new_episodes,    # record new data when we don't have it yet
      :match_requests_on => [:method, :uri, :body] # The http method, URI and body of a request all need to match
    }
  end

end
