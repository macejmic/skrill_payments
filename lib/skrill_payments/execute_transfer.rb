class ExecuteTransfer < Api

  def initialize(sid)
    @sid = sid
    super()
  end

  def params
    {
      action: 'transfer',
      sid:    @sid
    }.merge(super)
  end

end
