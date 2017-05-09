Rails.application.routes.draw do
  root 'logins#index'
  resources :admins do
    collection do
     get 'chkrpt'
    end
  end
  resources :users do
    collection do
     get 'createuser'
    end
  end
  resources :subjects
  resources :settings
  resources :scores
  resources :questions do
    resources :answers
    collection do
      get 'addquestion'
      get 'addin'
    end
  end
  resources :answers do
    collection do
      get 'changeanswer'
      get 'createanswer'
    end
  end
  resources :progres
  resources :errquests do
    collection do
      get 'errcount'
    end
  end
  resources :chapters
  resources :logins
  resources :returnjsons do
    collection do
      get 'getquestion'
      get 'getanswer'
      get 'updatecheck'
      get 'chapter'
      get 'subject'
      get 'getvalidate'
      get 'getuser'
      get 'changepassword'
      get 't_errquests'
      get 'r_errquests'
      get 'reguser'
      get 'del_errquests'
      get 'cla'
      get 'classdetail'
      get 'avatar'
      get 'topavatar'
      get 'leftavatar'
    end
  end
  resources :createlicenses do
    collection do
    get 'createlicense'
      get 'ajaxcreate'
    end
  end
resources :cpuids
  resources :licenses
  resources :loginlogs
  resources :clas do
    collection do
      get 'validateflag'
      get 'delquestion'
    end
  end
  resources :avaters
  resources :topavatars
  resources :leftavatars
  resources :welcomes


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
