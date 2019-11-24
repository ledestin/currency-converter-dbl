shared_context "banks" do
  let(:date_in_the_past) { "2015-01-18" }
  let(:bank_in_the_past) do
    Bank.get date_in_the_past do |bank|
      bank.cache = "spec/fixtures/rates-2015-01-18.json"
    end
  end
  let(:bank_today) do
    Bank.get :today do |bank|
      bank.cache = "spec/fixtures/rates-today.json"
    end
  end
end
