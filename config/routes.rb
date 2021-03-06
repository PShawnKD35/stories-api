Rails.application.routes.draw do
  root to: 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :stories, only: [:index, :show, :create, :update, :destroy]
      post 'stories/:id/comments', to: 'stories#create_comment', as: :comment
    end
  end
end
