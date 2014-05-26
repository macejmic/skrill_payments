class Api

  BASE_URL = 'https://www.moneybookers.com/app/pay.pl'

  attr_reader :payment, :account

  def call
    response  = connection.get '', params.merge(default_params)
    data      = XmlSimple.xml_in(response.body)

    if data['error']
      raise SkrillPaymentsException, data['error']
    end

    data
  end

  protected

  def params(object, attributes)
    request_params = {}
    attributes.each do |attribute|
      request_params[attribute] = object.send(attribute)
    end
    request_params
  end

  def default_params
    {
      email:    account[:email]    || SkrillPayments.configuration.email,
      password: account[:password] || SkrillPayments.configuration.password
    }
  end

  private

  def connection
    Faraday.new(url: BASE_URL)
  end

end
