class ExecuteTransfer < Api

  ATTRIBUTES = [:sid]

  def initialize(payment)
    @payment = payment
    super()
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
