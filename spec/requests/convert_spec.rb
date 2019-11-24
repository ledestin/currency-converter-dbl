require "rails_helper"

describe "Currency conversion" do
  include_context "requests"
  include_context "banks"

  it "converts 1 NZD to USD" do
    allow(Bank).to receive(:get).and_return(bank_today)

    get "/convert", params: {
      amount: 1, from_currency: "NZD", to_currency: "USD"
    }

    expect(response).to have_http_status(:ok)
    expect(response_json["converted_amount"]).to eq "$0.64"
  end
end
