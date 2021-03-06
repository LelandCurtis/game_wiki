Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'homepage#index'

  get '/levels', to: 'levels#index'
  get '/levels/new', to: 'levels#new'
  get '/levels/:id', to: 'levels#show'
  post '/levels', to: 'levels#create'
  get '/levels/:level_id/edit', to: 'levels#edit'
  patch '/levels/:level_id', to: 'levels#update'
  delete '/levels/:level_id', to: 'levels#destroy'

  get '/monsters', to: 'monsters#index'
  get '/monsters/:id', to: 'monsters#show'
  get '/monsters/:id/edit', to: 'monsters#edit'
  patch '/monsters/:id', to: 'monsters#update'
  delete '/monsters/:id', to: 'monsters#destroy'

  get '/roles', to: 'roles#index'
  get '/roles/new', to: 'roles#new'
  get '/roles/:id', to: 'roles#show'
  post '/roles', to: 'roles#create'
  get '/roles/:role_id/edit', to: 'roles#edit'
  patch '/roles/:role_id', to: 'roles#update'
  delete '/roles/:role_id', to: 'roles#destroy'

  get '/weapons', to: 'weapons#index'
  get '/weapons/:id', to: 'weapons#show'
  get '/weapons/:id/edit', to: 'weapons#edit'
  patch '/weapons/:id', to: 'weapons#update'
  delete '/weapons/:id', to: 'weapons#destroy'

  get '/roles/:role_id/weapons', to: 'role_weapons#index'
  get '/roles/:role_id/weapons/new', to: 'role_weapons#new'
  post '/roles/:role_id/weapons', to: 'role_weapons#create'

  get '/levels/:level_id/monsters', to: 'level_monsters#index'
  get '/levels/:level_id/monsters/new', to: 'level_monsters#new'
  post '/levels/:level_id/monsters', to: 'level_monsters#create'
end
