class PrepareTransfer < Api

  def params
    {
      action:     'prepare',
      amount:     '29',
      currency:   'EUR',
      bnf_email:  'receiver@email.com',
      subject:    'some subject',
      note:       'some note',
      frn_trn_id: '3482734234'
    }.merge(super)
  end

end
