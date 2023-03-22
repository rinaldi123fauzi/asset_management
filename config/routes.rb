Rails.application.routes.draw do


  resources :approvals
  resources :loans
  resources :stocks
  resources :employees
  resources :tools
  resources :softwares
  resources :vendors
  resources :adjustment_jobs
  resources :additional_jobs
  resources :areas
  resources :master_jobs
  resources :material_types
  resources :units
  resources :sub_work_categories
  resources :work_categories
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root 'home#index'
  get 'master/index', to: "master#index"
  resources :change_passwords, only: [:edit] do
    collection do
      patch 'update_password'
    end
  end
  resources :roles
  resources :users
  resources :data_companies
  resources :categories
  resources :contacts
  resources :work_units

  resources :helper_json do
    post :getJudulPekerjaan, on: :collection
    post :getNamaPekerjaan, on: :collection
    post :simpanVendor, on: :collection
    post :updateVendor, on: :collection
    get :getDetailVendor, on: :collection
    get :getAllVendor, on: :collection
    get :getDetailAlat, on: :collection
    post :simpanAlat, on: :collection
    post :updateAlat, on: :collection
    member do
      get "/sub_work_category", to: "helper_json#getSubWorkCategory"
    end
  end

  
  # resources :categories do
  #   resources :contacts, only: [:index], module: :categories
  # end
  # resources :type_workers

end
