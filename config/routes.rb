ExampleRegistrations::Application.routes.draw do
  root to: 'welcome#show'
  get '/auth/passport/callback' => 'sessions#create'
  delete '/sign-out' => 'sessions#destroy', as: 'sign_out'
  get '/register' => 'orders#new'
  post '/register' => 'orders#create'
  get '/confirm' => 'orders#show'
  get '/pay' => 'payments#new'
  post '/pay' => 'payments#create'
  get '/thanks' => 'thanks#show'
end
