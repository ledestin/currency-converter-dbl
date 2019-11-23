class CurrenciesController < ApplicationController
  def index
    render json: { available_currencies: Bank.available_currencies }
  end
end
