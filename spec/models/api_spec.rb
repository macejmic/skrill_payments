require 'spec_helper'

class Dummie < Api; end

describe Api do

  it 'creates params -> values from object, keys from attributes' do

    object      = double('Payment', currency: 'CZK', amount: 10, user_id: 20)
    attributes  = [:currency, :amount]
    params      = Dummie.new.send(:params, object, attributes)

    expect(params).to eq({ currency: 'CZK', amount: 10 })
  end

  it 'creates default params from config' do

    params = Dummie.new.send(:default_params)

    expect(params).to eq(
      {
        email:    'michal.macejko1@gmail.com',
        password: '2347237842346234623476276'
      }
    )
  end
end
