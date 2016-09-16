Rails.application.routes.draw do
  post "/sns_notifications", to: "sns#index"
end
