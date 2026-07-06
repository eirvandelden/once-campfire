require "test_helper"

WebMock.disable!

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome, screen_size: [ 1400, 1400 ] do |options|
    chrome_binary = ENV["GOOGLE_CHROME_BIN"] || Dir[File.expand_path("~/.cache/selenium/chrome/mac-*/**/Google Chrome for Testing.app/Contents/MacOS/Google Chrome for Testing")].max
    options.binary = chrome_binary if chrome_binary
  end

  include SystemTestHelper
end
