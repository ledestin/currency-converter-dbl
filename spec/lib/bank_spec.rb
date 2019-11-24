require "rails_helper"

describe Bank do
  include_context "banks"

  describe ".get" do
    it "ensures banks have different rates" do
      one_nzd_in_usd_now = Money.new(100, "NZD", bank_today).exchange_to("USD")
      expect(one_nzd_in_usd_now.cents).to eq 64

      one_nzd_in_usd_in_the_past = Money.new(100, "NZD", bank_in_the_past)
        .exchange_to("USD")
      expect(one_nzd_in_usd_in_the_past.cents).to eq 79
    end

    it "sets appropriate date for a new bank" do
      expect(Bank.get(date_in_the_past).date).to eq "2015-01-18"
    end

    it "doesn't set date for :today date" do
      expect(Bank.get(:today).date).to be_nil
    end
  end

  describe ".convert" do
    it "converts NZD to USD as of today" do
      allow(Bank).to receive(:get).with(:today).and_return(bank_today)

      expect(Bank.convert(1, "NZD", "USD")).to eq Money.new(64, "USD")
    end

    it "converts NZD to USD as of the past" do
      allow(Bank).to receive(:get).with(date_in_the_past)
        .and_return(bank_in_the_past)

      expect(Bank.convert(1, "NZD", "USD", date_in_the_past)).to \
        eq Money.new(79, "USD")
    end
  end
end
