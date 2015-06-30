Rails.application.routes.draw do
  
  
  resources :test_papers

  mount Ckeditor::Engine => '/ckeditor'
  resources :test_attempts

  resources :teachers do
    resources :groups
  end

  resources :courses do
    resources :customized_concepts
    get 'concept_map'
    get 'concept_list'
    get 'list_students'
    get 'reports'
    get 'course_filter', on: :collection
    get 'filter_by_level', on: :collection
    get 'change_status/:group_id', to: 'courses#change_status', as: 'change_status'
  end

  resources :groups do
    resources :courses
    post 'add_student', on: :collection
  end

  resources :prototypes do
    get 'landing_page', on: :collection
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  

  authenticated :user do
    root to: "prototypes#index", as: :authenticated_root
  end
  unauthenticated do
    root to: "prototypes#landing_page", as: :unauthenticated_root
  end
  
  get '/courses/12/' => 'prototype#course', as: :course1
  get '/courses/13/' => 'prototype#course2', as: :course2
  get '/courses/14/' => 'prototype#course3', as: :course3
  get '/test/12/' => 'prototype#test', as: :test
  get '/test/13/' => 'prototype#test2', as: :test2
  get '/test/14/' => 'prototype#test3', as: :test3
  get '/test/15/' => 'prototype#special_test', as: :special_test
  get '/test/12/result' => 'prototype#result', as: :result
  get '/test/13/result' => 'prototype#result2', as: :result2
  get '/test/14/result' => 'prototype#result3', as: :result3
  get '/rank' => 'prototype#rank', as: :rank
  get '/mission_center' => 'prototype#mission_center', as: :mission_center
  get '/mission_danger' => 'prototype#mission_danger', as: :mission_danger
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

  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    # omniauth_callbacks: "users/omniauth_callbacks",
    # confirmations: "users/confirmations",
    # passwords: "users/passwords"
  }

  devise_scope :user do
    get 'users/student_new', to: 'users/registrations#student_new', :as => :new_student_registration
    get 'users/teacher_new', to: 'users/registrations#teacher_new', :as => :new_teacher_registration
    # get 'users/student_edit', to: 'users/registrations#student_edit', :as => :edit_student_registration
    # get 'users/teacher_edit', to: 'users/registrations#teacher_edit', :as => :edit_teacher_registration
  end


  
  resources :customized_concepts do
    resources :tests
    resources :test_attempts
    resources :test_papers
    get 'student_detail/:user_id', to: 'customized_concepts#student_detail', as: 'student_detail'
    get 'paper_option', on: :collection
  end
end
