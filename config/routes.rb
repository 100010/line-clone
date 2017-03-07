Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root 'welcome#index'

  resources :users, only: [] do
    member do
      get :home
      get :friends
      get :talks
      get :add_friends
      delete :quit_friend
    end
  end
end
