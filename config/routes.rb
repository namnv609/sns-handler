Rails.application.routes.draw do
  post "/sns_notifications", to: "sns#index"
  root to: "index#index"
end
