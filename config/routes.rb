RGyazo::Application.routes.draw do
  get "index/index"

  post "upload.cgi" => "images#create", as: :images
  match ":name.:format", :to => "images#show", as: :image
  get "404", :to => "index#error_404", as: :error_404
  get "403", :to => "index#error_403", as: :error_403
  root :to => "index#index"
end
