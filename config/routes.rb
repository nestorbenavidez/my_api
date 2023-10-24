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
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
