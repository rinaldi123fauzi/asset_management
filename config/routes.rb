Rails.application.routes.draw do


  resources :inventories
  resources :items
  resources :approvals
  resources :loans
  resources :employees
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
    post :updateSatker, on: :collection
    post :simpanSatker, on: :collection
    get :getDetailSatker, on: :collection
    get :getAllSatker, on: :collection
    post :simpanKaryawan, on: :collection
    post :updateKaryawan, on: :collection
    get :getDetailKaryawan, on: :collection
    post :hapusKaryawan, on: :collection
    get :approve, on: :collection
    get :reject, on: :collection
    get :done, on: :collection
    get :getDetailPeminjaman, on: :collection
    post :searchDataDashboard, on: :collection
    get :getDetailItem, on: :collection
    post :simpanItem, on: :collection
    post :updateItem, on: :collection
    get :getDetailInventory, on: :collection
    post :simpanInventory, on: :collection
    post :updateInventory, on: :collection
    get :getAllItem, on: :collection
    get :hapusSatker, on: :collection
    get :checkInventory, on: :collection
    get :deleteFile, on: :collection
    post :activationUser, on: :collection
    member do
      get "/sub_work_category", to: "helper_json#getSubWorkCategory"
    end
  end

  
  # resources :categories do
  #   resources :contacts, only: [:index], module: :categories
  # end
  # resources :type_workers

end
