Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
      root 'devise/sessions#new'
  end
  mount CmAdmin::Engine => "/cm_admin"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
