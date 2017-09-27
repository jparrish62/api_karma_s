require 'api_constraints'
ApiKarmaS::Application.routes.draw do
  namespace :api, defaults: {format: :json},
                            constraints: {subdomain: 'api'}, path: '/' do
    scope module: :v1,
      constraints: ApiConstraints.new(version: 1, default: true) do
        get '/oauth2callback' => 'calendar_appointments#callback'
        get '/calendar_appointments' => 'calendar_appointments#calendars'
          resources   :users,    :only => [:show,   :create, :update, :destroy] do
            resources   :stylists, :only => [:create, :update, :destroy] do
              resources :image_portfolios, :only => [:show, :create, :index]
              resources :appointments, :only => [:show, :create]
            end
          end
      resources   :sessions, :only => [:create, :destroy]
      resources   :stylists, :only => [:show, :index]
    end
  end
  devise_for :users, :controllers => { registrations: 'registrations' }
end
