DavidsCarpetsRails::Application.routes.draw do

  # API routes for ios app
  namespace :api do
    resources :ranges, :only => [:index] do
      resources :carpets, :only => [:index]
    end
  end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

end
