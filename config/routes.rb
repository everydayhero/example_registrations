ExampleRegistrations::Application.routes.draw do
  root to: 'welcome#show'

  get '/auth/passport/callback' => 'omniauth_sessions#create'

  scope '/register' do
    get '/' => 'registrations#new', as: 'register'
    post '/' => 'orders#create'

    scope '/:order_id' do
      get '/other' => 'secondary_registrations#new', as: 'secondary_registration'
      post '/other' => 'orders#update'
      get '/confirm' => 'orders#show'
      get '/pay' => 'payments#new'
      post '/pay' => 'payments#create'
      get '/thanks' => 'thanks#show'
    end
  end

  get '/teams/register' => 'join_team_orders#new'
end
