module SkrillPayments

  def self.pay!
    prepare_transfer  = PrepareTransfer.new.call
    sid               = prepare_transfer['sid'][0]
    execute_transfer  = ExecuteTransfer.new(sid).call

    execute_transfer['transaction'][0]['status_msg'][0] == 'processed'
  end

end

# VERSION
require 'skrill_payments/version'

# GEM CLASS
require 'skrill_payments/api'
require 'skrill_payments/prepare_transfer'
require 'skrill_payments/execute_transfer'

# GEMS
require 'faraday'
require 'xmlsimple'
