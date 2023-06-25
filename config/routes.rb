Rails.application.routes.draw do
 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
 }

 devise_for :admin, skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
 }
 scope module: :public do
  root to: "homes#top"
  get '/about' => 'homes#about'
  resources :questions do
   resources :answers, only: [:create, :destroy]
   resource :question_favorites, only: [:create, :destroy]
  end
  resources :outfits do
   resources :comments, only: [:create, :destroy]
   resource :favorites, only: [:create, :destroy]
  end
  get '/customers/is_deleted' => 'customers#is_deleted'
  patch '/customers/destroy' => 'customers#destroy'
  resources :customers, only: [:index, :show, :update, :edit]
 end

 namespace :admin do
  resources :outfits, only: [:index, :show, :destroy] do
   resources :comments, only: [:destroy]
  end
  resources :questions, only: [:index, :show, :destroy]
 end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
