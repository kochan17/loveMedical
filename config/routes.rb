Rails.application.routes.draw do
  root to: 'loves#new'
  resources :loves, only: %i[show new create]
end
