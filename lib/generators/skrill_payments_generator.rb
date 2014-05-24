class ScrillPayments < Rails::Generators::Base

  source_root(File.expand_path(File.dirname(__FILE__))

  def scrill_payments_config
    copy_file 'skrill_payments.rb', 'config/initializers/skrill_payments.rb'
  end

end
