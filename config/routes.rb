Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'products/index'
      post 'products/create'
      get 'products/show'
      patch 'products/edit'
      delete 'products/delete'
      get 'products/count'
      post 'products/move_product'

      get 'shops/index'
      post 'shops/create'
      get 'shops/show'
      patch 'shops/edit'
      delete 'shops/delete'
      get 'shops/count'
      post 'shops/move_Shop'

      get 'users/index'
      post 'users/create'
      get 'users/show'
      patch 'users/edit'
      delete 'users/delete'
      get 'users/count'
      post 'users/move_user'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
