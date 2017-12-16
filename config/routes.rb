Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pokemon, only:[:show,:index]
  get '/team', to: 'pokemon#team'
end
