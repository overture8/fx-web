class PagesController < ApplicationController
  include FxRates

  def home
    @currency_codes = CURR_CODES
    @from_text = params[:from_text]
    @to_text = params[:to_text]
  end

  def convert
    @date = Date.parse(params[:date])
    extract_param_values
    build_response_values
    redirect_to root_path(from_text: @from_text, to_text: @to_text)
  rescue FxRates::NoDateFoundError
    redirect_to root_path(
      :notice => 'No rates found for that date - Pick another one. Note: you may still need to choose a store (in config/initializers/fx_rates.rb) then run rake consume_api for this to work.'
    )
  rescue ArgumentError
    redirect_to root_path(
      :notice => 'Invalid date provided - please try another date.'
    )
  end

  private

  def extract_param_values
    @amount = params[:amount].to_f
    @from_code = params['currency-from']
    @to_code = params['currency-to']
  end

  def build_response_values
    result = ExchangeRate.at(@date, @from_code, @to_code) * @amount
    @from_text = "#{@amount} #{@from_code}"
    @to_text = "#{result.round(2)} #{@to_code}"
  end
end
