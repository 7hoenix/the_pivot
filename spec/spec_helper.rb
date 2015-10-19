require "factory_girl_rails"
require "coveralls"
require "mocha"
require 'omniauth'
require 'capybara/rspec'

require 'simplecov'



# SimpleCov.start

Coveralls.wear!

module IntegrationSpecHelper
  def login_with_oauth(service = :github)
    visit "/auth/#{service}"
  end
end


RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.include Capybara::DSL

  config.include FactoryGirl::Syntax::Methods


  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.disable_monkey_patching!

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.profile_examples = 5
  config.include IntegrationSpecHelper, :type => :request

  # Capybara.default_host = 'localhost:3000'

  OmniAuth.config.test_mode = true
  OmniAuth.config.add_mock(:github, {
    :uid => '12345',
    :credentials => {:token => "12345"},
    :nickname => 'somedude'
  })
end


