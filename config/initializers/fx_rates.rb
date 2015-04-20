require "fx_rates"

FxRates.configure do |config|
  config.store = Moneta.new(:File, dir: 'db/moneta')
  config.parser = FxRates::Api::Parser::Ecb
end
