Rails.application.routes.draw do
  get '/sites' => 'sites#index'
  root 'sites#index'
  get '/sites/:id' => 'sites#siteinfo', as: 'site'


  resources :sites

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
