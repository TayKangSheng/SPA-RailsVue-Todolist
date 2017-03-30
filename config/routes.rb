Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :todos, :path => "api/todos", :only => [:index, :show, :create, :update, :destroy], defaults: { format: 'json' }

  root 'static#index'
  get '*path' => 'static#index'

end
