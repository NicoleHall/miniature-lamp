Rails.application.routes.draw do

  resources :words, only: [:create, :destroy, :index] do
    delete '/', to: 'words#delete_all', on: :collection
    #on collection makes the route not have an id param before the actual definition of the route
  end

  resources :anagrams, only: [] do
    get '/:word', to: 'anagrams#show', on: :collection
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
