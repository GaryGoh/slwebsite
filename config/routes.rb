Slwebsite::Application.routes.draw do



  #resources :timetables

  #resources :messages

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :users do
    resources :issues
    resources :notis
    resources :messages
    resources :comments
    resources :timetables


  end
  resources :sessions, only: [:new, :create, :destroy]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".


  get "home" => "static_page#home"
  get "faq" => "faq#faq"
  get "about" => "static_page#about"
  get "society" => "society#index"
  get "access_error" => "static_page#_access_error"

  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/failure', to: 'sessions#failure', via: 'delete'

  #delete '/signout', to: 'sessions#destroy', as: 'signout'

  root 'static_page#index'

  get '/news', to: 'public_news#allnews'
  get '/notis', to: 'public_news#notifies'
  get '/read', to: 'public_news#readmode'
  get 'shownews/:id', to: 'public_news#shownews', as: :shownews
  get 'shownotis/:id', to: 'public_news#shownotis', as: :shownotis
  get 'indexnotic/:id', to: 'public_news#indexnotic', as: :indexnotic



  get '/download', to: 'material#download'

  get '/slmember', to: 'slmember#list'
  get 'show/:id', to: 'slmember#show', as: :show
  get 'societyshow/:id', to: 'society#showso', as: :societyshow

  get "gy" => "society#gy"
  get "wy" => "society#wy"
  get "ty" => "society#ty"
  get "xs" => "society#xs"

  get '/messages', to: 'messages#index'
  get '/comments', to: 'comments#index'
  get '/profile/:stuid', to: 'users#publicShow', as: :publicShow






  #get '/users', to: 'issues#notis'

  #get '/users/:user_id/issues/notis', to: "issues#notis"

  #default_url_options :host => "0.0.0.0:3000"

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
