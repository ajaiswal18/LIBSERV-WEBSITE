Rails.application.routes.draw do
  
  
  
  devise_for :admins
  mount Ckeditor::Engine => '/ckeditor'

  resources :applicant_responses
  get 'applicant_responses/scores'
  # get 'applicant_responses/index'

  resources :shortlists

  # resources :onlinetests
  # get 'questions/new'

  devise_for :users
  #devise_for :users, :controllers => {:registrations => "shortlists"}
  resources :assessments
  resources :job_applicants
  resources :jobpostings
  
  get 'homepage/index'
  get 'homepage/hr_products'
  get 'homepage/services'
  get 'homepage/about_us'
  get 'homepage/performance'
  get 'homepage/payroll_expenses'
  get 'homepage/careers'
  get 'homepage/contact_us'
  get 'homepage/financial_perf'
  get 'homepage/our_team'
  get 'homepage/new'
  get 'homepage/jobpostings'
  get 'homepage/show'
  get 'homepage/job_apply'
  get 'homepage/support'
  get 'homepage/admin_page'
  get 'homepage/remove'

  

  
  
  
  


  # get 'homepage/job_apply'
  match 'create',    to: 'homepage#create', via: :post

  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'homepage#index'

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
