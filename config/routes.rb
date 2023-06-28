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
   resources :answers, only: [:new, :create, :destroy]
   resource :question_favorites, only: [:create, :destroy]
   collection do
      get 'search_for'
   end
  end
  resources :outfits do
   resources :comments, only: [:create, :destroy]
   resource :favorites, only: [:create, :destroy]
   collection do
      get 'search'
   end
  end
  resources :customers, only: [:index, :show, :update, :edit] do
   member do
    get :favorites
    get :is_deleted
    patch :withdraw
   end
  end
 end

 namespace :admin do
  resources :outfits, only: [:index, :show, :destroy] do
   resources :comments, only: [:destroy]
  end
  resources :questions, only: [:index, :show, :destroy] do
   resources :answers, only: [:destroy]
  end
  resources :customers, only: [:index, :show, :update, :edit]
 end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
