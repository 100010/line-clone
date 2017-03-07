Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root 'welcome#index'

  resources :users, only: [] do
    member do
      get :home
    end
  end
end
