# Add simplecov
require 'simplecov'
SimpleCov.start do
  add_filter 'test/'
end

require "minitest"
require "minitest/autorun"
require "minitest/reporters"

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative "../lib/date_range"
require_relative "../lib/reservation"
require_relative "../lib/hotel_booker"
require_relative "../lib/room"
