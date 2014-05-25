class Api

  BASE_URL = 'https://www.moneybookers.com/app/pay.pl'

  attr_reader :conection, :payment

  def initialize
    @conection = Faraday.new(url: BASE_URL)
  end

  def call
    response  = conection.get '', params
    data      = XmlSimple.xml_in(response.body)

    raise data['error'].inspect if data['error']

    data
  end

  protected

  def params(object, attributes)
    request_params = {}
    attributes.each do |attribute|
      request_params[attribute] = object.send(attribute)
    end
    request_params.merge(default_params)
  end

  def default_params
    {
      email:    SkrillPayments.configuration.email,
      password: SkrillPayments.configuration.password
    }
  end

end
