Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :plots, only: [:index] 
  
  delete "/plant_plots", to: "plant_plots#destroy"
  # delete '/veterinary_offices/:id', to: 'veterinary_offices#destroy'
  # resources :plant_plots, controller: :plant_plots, only: [:destroy]
end
