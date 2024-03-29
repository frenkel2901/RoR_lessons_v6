Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, path: :gurus,
                     path_names: { sign_in: :login, sign_out: :logout },
                     controllers: { sessions: 'users/sessions' }
  get 'users/new'
  get 'sessions/new'

  post '/admin/tests/:id/edit', to: 'admin/tests#edit'
  get '/tests/:id/start', to: 'tests#start'

  resources :tests, only: :index do
    resources :questions, shallow: true, only: :show do
      resources :answers, shallow: true, only: :show
    end
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      resources :gists, only: %i[create]
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, only: :index
    resources :badges
  end

  resources :feedbacks, only: %i[new create]
  resources :badges, only: %i[index]
  resources :given_badges

end
