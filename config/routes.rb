Rails.application.routes.draw do
  root :to => 'schedule#index'
  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      scope '/tasks' do
        get '/' => 'tasks#show'
        post '/' => 'tasks#create'
      end
    end
  end
end
