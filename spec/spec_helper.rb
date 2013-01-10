require 'rspec'
require 'github_status'

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter = 'documentation'
end