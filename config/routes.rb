RGyazo::Application.routes.draw do
  post "create" => "images#create", as: :images
  match ":name.:format", :to => "images#show", as: :image
  get "/404", :to => "welcom#error_404", as: :error_404
  get "/403", :to => "welcom#error_403", as: :error_403
  root :to => "welcom#index"
end
