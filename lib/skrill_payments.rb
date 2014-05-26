module SkrillPayments

  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

end

# VERSION
require 'skrill_payments/version'

# GEM CLASS
require 'skrill_payments/api'
require 'skrill_payments/skrill_payment'
require 'skrill_payments/prepare_transfer'
require 'skrill_payments/execute_transfer'
require 'skrill_payments/skrill_payments_exception'
require 'skrill_payments/configuration'

# GEMS
require 'faraday'
require 'xmlsimple'
