Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  get 'pages/home'
  devise_for :users, controllers: { :registrations => 'registrations',
                                    :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  resources :users
  resources :posts, only: [:index, :show, :create, :destroy, :new] do
    resources :likes, only: [:create, :destroy], shallow: true
    resources :comments, only: [:index, :create, :destroy], shallow: true
  end
end
