Rails.application.routes.draw do
  get '/sites' => 'sites#index'
  root 'sites#index'

  resources :sites

#  get '/sites/:id' => 'sites#siteinfo', as: 'site'


  # For details on the DSL available within this file,
  #see http://guides.rubyonrails.org/routing.html
end
