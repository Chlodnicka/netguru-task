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
  
  root to: 'home#index'

end
