Rails.application.routes.draw do


 devise_for :admin, skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
 }
 scope module: :public do
  root to: "homes#top"
  get '/about' => 'homes#about'
  resources :outfits
  get '/customers' => 'customers#index'
  get '/customer' => 'customers#show'
  get '/customers/information/edit' => 'customers#edit'
  get '/customers/is_deleted' => 'customers#is_deleted'
  patch '/customers/destroy' => 'customers#destroy'
  resource :customers, only: [:update]
 end
 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
 }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
