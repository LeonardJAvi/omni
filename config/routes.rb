Rails.application.routes.draw do
  # get '/test_mailer', to: 'app/front#test_mailer', as: :test_mailer
  root to: 'app/front#index'
  #get '/landing/:currency', to: 'app/front#index', as: :root_omni
  get 'destination/:id/:currency', to: 'app/front#destination', as: :destination

  devise_for :users, skip: KepplerConfiguration.skip_module_devise

  #KepplerViews
  get 'landing/:view_id/:currency', to: 'app/view#promotion' 

namespace :admin do
    resources :views do
      get '(page/:page)', action: :index, on: :collection, as: ''
      get '/clone', action: 'clone'
      delete(
        action: :destroy_multiple,
        on: :collection,
        as: :destroy_multiple
      )
  end

  root to: 'admin#root'

  resources :destinations do
    get '(page/:page)', action: :index, on: :collection, as: ''
    get '/clone', action: 'clone'
    post '/sort', action: 'sort'
    delete(
      action: :destroy_multiple,
      on: :collection,
      as: :destroy_multiple
      )

    resources :hotels do
      get '(page/:page)', action: :index, on: :collection, as: ''
      get '/clone', action: 'clone'
      post '/sort', action: 'sort'
      delete(
        action: :destroy_multiple,
        on: :collection,
        as: :destroy_multiple
        )
    end
    resources :plans do
      get '(page/:page)', action: :index, on: :collection, as: ''
      get '/clone', action: 'clone'
      post '/sort', action: 'sort'
      delete(
        action: :destroy_multiple,
        on: :collection,
        as: :destroy_multiple
        )
    end

    resources :excursions do
      get '(page/:page)', action: :index, on: :collection, as: ''
      get '/clone', action: 'clone'
      post '/sort', action: 'sort'
      delete(
        action: :destroy_multiple,
        on: :collection,
        as: :destroy_multiple
        )
    end
  end

  resources :scaffolds do
    get '(page/:page)', action: :index, on: :collection, as: ''
    get '/clone', action: 'clone'
    post '/import', action: 'import', as: 'import'
    delete(
      action: :destroy_multiple,
      on: :collection,
      as: :destroy_multiple
      )
  end

  resources :customizes do
    get '(page/:page)', action: :index, on: :collection, as: ''
    get '/clone', action: 'clone'
    post '/install_default', action: 'install_default'
    delete(
      action: :destroy_multiple,
      on: :collection,
      as: :destroy_multiple
      )
  end

  resources :users do
    get '(page/:page)', action: :index, on: :collection, as: ''
    delete(
      '/destroy_multiple',
      action: :destroy_multiple,
      on: :collection,
      as: :destroy_multiple
      )
  end

  resources :meta_tags do
    get '(page/:page)', action: :index, on: :collection, as: ''
    delete(
      '/destroy_multiple',
      action: :destroy_multiple,
      on: :collection,
      as: :destroy_multiple
      )
  end

  resources :google_adwords do
    get '(page/:page)', action: :index, on: :collection, as: ''
    delete(
      '/destroy_multiple',
      action: :destroy_multiple,
      on: :collection,
      as: :destroy_multiple
      )
  end

  resources :scripts do
    get '(page/:page)', action: :index, on: :collection, as: ''
    delete(
      '/destroy_multiple',
      action: :destroy_multiple,
      on: :collection,
      as: :destroy_multiple
      )
  end

  resources :settings, only: [] do
    collection do
      get '/:config', to: 'settings#edit', as: ''
      put '/:config', to: 'settings#update', as: 'update'
      put '/:config/appearance_default', to: 'settings#appearance_default', as: 'appearance_default'
    end
  end
end

  # Errors routes
  match '/403', to: 'errors#not_authorized', via: :all, as: :not_authorized
  match '/404', to: 'errors#not_found', via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

  # Dashboard route engine
  mount KepplerGaDashboard::Engine, at: 'admin/dashboard', as: 'dashboard'

end
