require "rails_helper"

feature "Currency conversion", js: true do
  include_context "banks"

  before do
    allow(Bank).to receive(:get).and_return(bank_today)
  end

  scenario "Successfully convert using default settings" do
    convert_currency

    expect_to_have_conversion_result_of "1 NZD", "$0.64 USD"
  end

  scenario "Successfully convert to selected destination currency" do
    convert_currency do
      select "JPY", from: "destination_currency"
    end

    expect_to_have_conversion_result_of "1 NZD", "¥70 JPY"
  end

  scenario "Successfully convert from selected source currency" do
    convert_currency do
      select "AUD", from: "source_currency"
    end

    expect_to_have_conversion_result_of "1 AUD", "$0.68 USD"
  end

  scenario "Successfully convert on a past date" do
  end

  context "hide conversion output on input change" do
    scenario "on date change" do
    end

    scenario "on amount change" do
    end

    scenario "on source currency change" do
    end

    scenario "on destination currency change" do
    end
  end

  scenario "Successfully swap source and destination currencies" do
  end

  private

  def convert_currency
    visit "/"
    yield if block_given?
    click_button ">"
  end

  def expect_to_have_conversion_result_of(source_amount, destination_amount)
    expect(page).to have_text("#{source_amount} =\n#{destination_amount}")
  end
end
