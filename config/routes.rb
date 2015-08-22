Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  root 'courses_simulator#index'

  get '/landing-page' => 'pages#index'
  get '/app' => 'pages#app'
  get '/not-support-yet' => 'pages#not-support-yet'
  get '/user-has-courses-count' => 'pages#user_has_courses_count'
  get '/polls/male' => 'polls#male_poll'
  get '/polls/female' => 'polls#female_poll'
  get '/get-poll-result' => 'polls#get_poll_result'

  resources :courses_simulator, only: [:index, :create, :destroy]
  resources :user_followed_user, only: [:index, :create, :destroy]

  resources :course_users
  resources :users
  resources :polls
  resources :course_comments
  resources :ask_courses
  resources :courses
  resources :chat_groups
  resources :chat_group_members
  resources :chat_messages

  get '/get-poll-sample' => 'users#get_poll_sample'
  get '/find_user_by_user_id' => 'users#find_user_by_user_id'
  get '/get_messages' => 'chat_messages#get_messages'
  get '/course' => 'courses#course'
  get '/search-users' => 'users#search'
  get '/search-course-comments' => 'course_comments#search'
  post 'upload' => 'proxy#image_upload'
  post 'user_first_login' => 'users#first_login_callback'
  post 'user_shared' => 'users#shared_callback'
  post 'user_subscribed' => 'users#subscribed_callback'

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
