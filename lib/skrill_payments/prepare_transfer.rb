class PrepareTransfer < Api

  ATTRIBUTES = [:amount, :currency, :bnf_email, :subject, :note, :frn_trn_id]

  def initialize(payment)
    @payment = payment
  end

  def params
    super(payment, ATTRIBUTES)
  end

  def default_params
    {
      action: 'prepare'
    }.merge(super)
  end

end
