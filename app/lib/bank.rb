require 'money/bank/open_exchange_rates_bank'

module Bank
  @cache = {}

  # WARNING: Ignore being thread-safe for now.
  def self.get(date = :today, &b)
    @cache[date] ||= create(date, &b)
  end

  private

  def self.create(date)
    new_bank = Money::Bank::OpenExchangeRatesBank.new
    new_bank.app_id = ENV["OXR_APP_ID"]

    yield new_bank if block_given?

    new_bank.update_rates
    new_bank
  end
end
