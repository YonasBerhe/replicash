Rails.application.routes.draw do
  get 'welcome/index'
  get 'home/index'
  # devise_for :users
  devise_for :users, class_name: 'FormUser', :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  match '/welcome/:id/finish_signup' => 'welcome#finish_signup', via: [:get, :patch], :as => :finish_signup

  get 'welcome/index'
  root 'welcome#index'
  get '/health', to: proc { [200, {}, ['']] } 

  match "*coupon", to: "welcome#handle_token", via: :all

end
