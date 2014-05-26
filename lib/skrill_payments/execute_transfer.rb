class ExecuteTransfer < Api

  ATTRIBUTES = [:sid]

  def initialize(payment, account = {})
    @payment = payment
    @account = account
  end

  def params
    super(payment, ATTRIBUTES)
  end

  def default_params
    {
      action: 'transfer'
    }.merge(super)
  end

end
