Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :plots, only: [:index] 

  resources :gardens, only: [:show] 
  
  delete "/plant_plots", to: "plant_plots#destroy"
end
