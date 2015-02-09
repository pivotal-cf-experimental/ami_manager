require 'ami_manager'
require 'tempfile'

RSpec.configure do |config|
  config.expect_with(:rspec) { |c| c.syntax = :expect }
end
