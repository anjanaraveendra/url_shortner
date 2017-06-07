Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'url#index'

  get '/:link' => 'url#redirect'
  namespace :api do
    namespace :v1 do
      resources :shortner
    end
  end
end
