require "rails_helper"

describe "Available currencies" do
  let(:response_json) { JSON.parse response.body }

  it "gets list of available currencies" do
    get "/currencies"

    expect(response).to have_http_status(:ok)
    expect(response_json["available_currencies"]).to include("USD")
  end
end
