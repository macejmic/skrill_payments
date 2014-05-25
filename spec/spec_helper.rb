require 'bundler/setup'
Bundler.setup

require 'skrill_payments'

RSpec.configure do |config|
end

# SUPPORT FILES
require File.expand_path('../support/config.rb', __FILE__)
require File.expand_path('../support/payment.rb', __FILE__)


