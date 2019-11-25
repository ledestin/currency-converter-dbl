class ConversionController < ApplicationController
  def index
    amount = Float(params[:amount])
    source_currency = params[:source_currency]
    destination_currency = params[:destination_currency]
    date = params[:date]

    render json: {
      converted_amount: Bank.convert(amount, source_currency,
                                     destination_currency, date).format
    }
  end
end
