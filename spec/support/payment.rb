class Payment
  include SkrillPayment

  def amount
    10
  end

  def currency
    'CZK'
  end

  def recipient_email
    'michal@macejko.sk'
  end

  def subject
    'asdasd'
  end

  def note
    'asdasd'
  end

  def reference_id
    '9823472348'
  end

end
