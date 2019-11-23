require "rails_helper"

describe Bank do
  describe ".get" do
    let(:date_in_the_past) { Date.parse "2015-01-18" }
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

    it "ensures banks have different rates" do
      one_nzd_in_usd_now = Money.new(100, "NZD", bank_today).exchange_to("USD")
      expect(one_nzd_in_usd_now.cents).to eq 64

      one_nzd_in_usd_in_the_past = Money.new(100, "NZD", bank_in_the_past)
        .exchange_to("USD")
      expect(one_nzd_in_usd_in_the_past.cents).to eq 79
    end
  end
end
