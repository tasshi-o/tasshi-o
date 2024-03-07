Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  
  get 'posts/home' => 'posts#home'
  get 'posts/select' => 'posts#select'
  get 'posts/name' => 'posts#name'
  get 'posts/sect' => 'posts#sect'
  get 'posts/address' => 'posts#address'
  get 'posts/genre' => 'posts#genre'
  get 'posts/about' => 'posts#about'
  get 'posts/image' => 'posts#image'
  get 'posts/hokkaido'  => 'posts#hokkaido'
  get 'posts/touhoku'  => 'posts#touhoku'
  get 'posts/kanto'  => 'posts#kanto'
  get 'posts/tyubu'  => 'posts#tyubu'
  get 'posts/kinki'  => 'posts#kinki'
  get 'posts/tyubu'  => 'posts#tyubu'
  get 'posts/chusioku' => 'posts#chusioku'
  get 'posts/kyusyu'  => 'posts#kyusyu'
  
  resources :users, only: [:show]
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
  
 
  root 'posts#home'



  



end