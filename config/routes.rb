Rails.application.routes.draw do

  devise_for :users

  resources :students do
    get :subjects
  end
  resources :teachers

  #resources :reports do
   # get :subjects
  #end

  get 'reports/index', to: 'reports#subjects', as: 'report_subjects'

  get 'visitors/index', to: 'visitors#index', as: 'visitors'

  root to: 'home#index'

end
