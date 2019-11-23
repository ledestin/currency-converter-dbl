Rails.application.routes.draw do
  root to: "home#index"

  get "/currencies", to: "currencies#index"
end
