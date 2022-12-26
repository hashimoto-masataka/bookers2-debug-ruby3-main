Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "homes#top"
  get "home/about"=>"homes#about"
  get "search" => "searches#search"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' =>'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :groups, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    get "join" => "groups#join"
    delete "all_destroy" => 'groups#all_destroy'
    get "new/mail" => "groups#new_mail"
    get "send/mail" => "groups#send_mail"
  end

  resources :messages, only: [:create]
  resources :rooms, only: [:create, :index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end