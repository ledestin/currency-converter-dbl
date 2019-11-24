require 'money/bank/open_exchange_rates_bank'

module Bank
  @cache = {}

  # WARNING: Ignore being thread-safe for now.
  def self.get(date = :today, &b)
    date = :today if date.blank?
    @cache[date] ||= create(date, &b)
  end

  def self.available_currencies
    get(:today).oer_rates.keys
  end

  def self.convert(amount, from_currency, to_currency, date = :today)
    bank = get date

    Money.from_amount(amount, from_currency, bank).exchange_to(to_currency)
  end

  private

  def self.create(date)
    new_bank = Money::Bank::OpenExchangeRatesBank.new
    new_bank.app_id = ENV["OXR_APP_ID"]
    new_bank.date = date unless date == :today

    yield new_bank if block_given?

    new_bank.update_rates
    new_bank
  end
end
