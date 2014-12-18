ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'capybara/poltergeist'

# Run queues synchronously
Resque.inline = true

class ActiveSupport::TestCase
  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  require "#{Rails.root}/db/seeds.rb"
  include Capybara::DSL
  include Warden::Test::Helpers

  Warden.test_mode!
  Capybara.current_driver = :poltergeist
  Capybara.javascript_driver = :poltergeist

  setup do
    Capybara.reset_sessions!
  end

  def teardown
    Warden.test_reset!
  end

  def login_to_admin
    @admin = Admin.first
    login_as @admin
    visit('/admin')
  end
end

