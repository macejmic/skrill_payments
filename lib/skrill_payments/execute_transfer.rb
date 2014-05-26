class ExecuteTransfer

  include Api

  ATTRIBUTES = [:sid]

  def initialize(payment)
    @payment = payment
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
