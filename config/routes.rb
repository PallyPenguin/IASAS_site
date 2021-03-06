Rails.application.routes.draw do
  resources :events
    root 'static_pages#home'
    get 'gallery' => 'static_pages#gallery'
    get 'streams' => 'static_pages#streams'
    get 'profiles' => 'static_pages#profiles'
    get 'booster' => 'static_pages#booster'
    get 'guidelines' => 'static_pages#guidelines'
    get 'schedule' => 'static_pages#schedule'
    get 'eventlist' => 'static_pages#eventlist'
    get 'hfame' => 'static_pages#hfame'
    get 'results' => 'static_pages#results'
    delete '/logout' => 'sessions#destroy'
    get "/auth/:provider/callback" => 'sessions#create'
    get 'userprof' => 'static_pages#userprof'
    resources :users do
        member do
            get :following, :followers
        end
    end
    resources :articles
    resources :u_relationships, only: [:create, :destroy]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

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
