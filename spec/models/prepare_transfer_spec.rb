require 'spec_helper'

describe PrepareTransfer do

  before do
    @payment          = Payment.new
    @prepare_transfer = PrepareTransfer.new(@payment)
  end

  it 'returns all required params' do

    @prepare_transfer.params

  end

end
