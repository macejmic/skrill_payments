class Api

  #BASE_URL = Rails.application.config.scrill_payments_api_base_url
  BASE_URL = 'https://www.moneybookers.com/app/pay.pl'

  attr_reader :payment

  def initialize
    @conection = Faraday.new(url: BASE_URL)
  end

  def call
    response  = @conection.get '', params
    data      = XmlSimple.xml_in(response.body)

    #temp responses because Skrill account is not ready
    data = if params[:action] == 'prepare'
      XmlSimple.xml_in('<?xmlversion="1.0" encoding="UTF-8"?> <response><sid>5e281d1376d92ba789ca7f0583e045d4</sid> </response>')
    else
      XmlSimple.xml_in('<?xml version="1.0" encoding="UTF-8"?> <response> <transaction><amount>1.20</amount> <currency>EUR</currency> <id>497029</id><status>2</status> <status_msg>processed</status_msg> </transaction></response>')
    end

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
      email:    'michal.macejko1@gmail.com',
      password: 'XYZ'
    }
  end

end
