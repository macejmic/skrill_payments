module SkrillPayment

  attr_accessor :sid

  def bnf_email
    recipient_email
  end

  def frn_trn_id
    reference_id
  end

end
