Rails.application.routes.draw do
  get '/sites' => 'sites#sitelist'
  root 'sites#sitelist'
  get '/sites/:id' => 'sites#siteinfo', as: 'site'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
