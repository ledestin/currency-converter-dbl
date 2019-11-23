Money.default_bank = Bank.get(:today) do |new_bank|
  new_bank.ttl_in_seconds = 86400
  new_bank.cache = "tmp/money-bank-today-cache.json"
end
