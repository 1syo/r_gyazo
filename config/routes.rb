RGyazo::Application.routes.draw do
  resources :admin, only: [:index, :destroy]
  post "upload.cgi" => "images#create", as: :images
  get "404", :to => "index#error_404", as: :error_404
  get "403", :to => "index#error_403", as: :error_403
  match ":name.:format", :to => "images#show", as: :image
  root :to => "admin#index"
  match '*a(.:format)', :to => 'index#error_404'
end
