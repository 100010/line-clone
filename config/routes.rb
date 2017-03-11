Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root 'welcome#index'

  resources :messages

  resources :users, only: [] do
    resources :chat_rooms
    member do
      get :home
      get :friends
      get :talks
      get :setting
      get :add_friends
      get :start_talk
      get :search
      post :add_friend
      delete :quit_friend
    end
  end
end
