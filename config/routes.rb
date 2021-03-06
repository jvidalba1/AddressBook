Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]

  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :organizations do
      resources :contacts
    end
  end

  get '/api' => redirect('/swagger/dist/index.html?url=/apidocs/api-docs.json')
end
