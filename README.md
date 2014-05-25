# [WIP] SkrillPayments

## Installation

Add this line to your application's Gemfile:

    gem 'skrill_payments'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install skrill_payments

Create a configuration file for Scrill Payments.

    $ touch config/initializers/scrill_payments.rb

With following content.

    Rails.configuration.scrill_payments_email     = 'michal.macejko1@gmail.com'
    Rails.configuration.scrill_payments_password  = '3427342378427834782347832'
    # your password in MD5

## Usage

  Put this code into your Payment class.

    include ScrillPayment

  Your payment class must contain all attributes/methods which is required for transfer money.

    [:amount, :currency, :recipient_email, :subject, :note, :reference_id]
    # :reference_id is optional attribute

  For example:

    class Payment

      include ScrillPayment

      def amount
        price + fees
      end

      def currency
        bank.czech? 'CZK' : 'ENG'
      end

      def recipient_email
        client.email
      end

      def subject
        'My super subject'
      end

      def note
        'Money for your service'
      end

      def reference_id
        id
      end

    end

  And in your controller just put the following code:

    def pay_for_service
      payment = Payment.find(params[:id])
      begin
        ScrillPayment.pay!(payment)
      rescue => e
        # do stuff
      end
      redirect_to payments_path
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
