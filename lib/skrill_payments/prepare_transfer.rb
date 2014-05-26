class PrepareTransfer < Api

  ATTRIBUTES = [:amount, :currency, :bnf_email, :subject, :note, :frn_trn_id]

  def initialize(payment, account = {})
    @payment = payment
    @account = account
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
