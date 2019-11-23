ActiveSupport.on_load(:active_record) do
  Money.locale_backend = :i18n
  I18n.locale = :en

  Money.default_bank = Bank.get(:today) do |new_bank|
    new_bank.ttl_in_seconds = 86400
    new_bank.cache = "tmp/money-bank-today-cache.json"
  end
end
