CornerstoneCms::Application.routes.draw do

  root :to => 'main#content_page'

  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }, :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  devise_scope :user do
    get "/logout" => "devise/sessions#destroy"
  end

  resources :files
  resources :file_browsers

  resources :user_sessions
  
  resources :pages, :menu_items

  namespace :admin do
    resources :pages
    resources :menu_items
    post "menu_items/sort" => 'menu_items#sort'
    resources :images
    match '/page-versions/show/:id' => 'page_versions#show', :as => "page_versions_show"
    match '/page-versions/restore/:id' => 'page_versions#restore', :as => "page_versions_restore"
    resources :users
    post 'users/toggle-admin' => 'users#toggle_admin'
  end

  match '/admin' => 'admin#index', :as => 'admin'

  match ':controller/:action/:id'
  match ':controller/:action/:id.:format'

  #All content pages
  match ':path' => 'main#content_page'
end
