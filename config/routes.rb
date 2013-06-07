RGyazo::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :administrators
  #resources :admin, only: [:index, :destroy]
  post "upload.cgi" => "images#create", as: :images
  get "404", :to => "index#error_404", as: :error_404
  get "403", :to => "index#error_403", as: :error_403
  get ":name.:format", :to => "images#show", as: :image
  root :to => "index#index"
  get '*a(.:format)', :to => 'index#error_404'
end
