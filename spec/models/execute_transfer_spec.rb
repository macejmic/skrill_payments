require 'spec_helper'

describe ExecuteTransfer do

  before do
    @payment          = Payment.new
    @payment.sid      = '4234278347827823487'
    @prepare_transfer = ExecuteTransfer.new(@payment)
  end

  it 'returns all required params' do

    params = @prepare_transfer.params

    ExecuteTransfer::ATTRIBUTES.each do |attribute|
      expect(params.include?(attribute)).to eq true
    end
  end

  it 'merge parent default params' do

    expect(@prepare_transfer.default_params.include?(:email)).to eq true
  end

  it 'must contain specified attributes' do

    expect(ExecuteTransfer::ATTRIBUTES).to_not eq nil
  end
end
