ENV["RACK_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)

require "capybara"
require "capybara/rspec"

Capybara.app = RobotWorldApp
