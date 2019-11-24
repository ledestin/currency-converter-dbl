class ConversionController < ApplicationController
  def index
    amount = Float(params[:amount])
    from_currency = params[:from_currency]
    to_currency = params[:to_currency]
    date = params[:date]

    render json: {
      converted_amount: Bank.convert(amount, from_currency, to_currency, date)
        .format
    }
  end
end
