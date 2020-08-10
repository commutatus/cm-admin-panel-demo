Rails.application.routes.draw do
  namespace :admin do 
    resources :users
  end
  get 'sign_in' => 'welcome#sign_in'
  get 'sign_up' => 'welcome#sign_up'
  get 'reset_password' => 'welcome#reset_password'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
