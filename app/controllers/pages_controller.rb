class PagesController < ApplicationController
  include FxRates

  def home
    @currency_codes = CURR_CODES
    @from_text = params[:from_text]
    @to_text = params[:to_text]
  end

  def convert
    date = Date.parse("2015-04-17")
    amount = params[:amount].to_f
    from_code = params['currency-from']
    to_code = params['currency-to']
    result = ExchangeRate.at(date, from_code, to_code) * amount
    from_text = "#{amount} #{from_code}"
    to_text = "#{result} #{to_code}"
    redirect_to root_path(from_text: from_text, to_text: to_text)
  end
end
