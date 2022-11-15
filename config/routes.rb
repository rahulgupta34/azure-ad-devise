Rails.application.routes.draw do
  # devise_for :users
  root to: "pages#home"
  devise_for :users, 
             controllers: {                                 
               sessions:           'users/sessions',                                                                             
               omniauth_callbacks: 'users/omniauth_callbacks'                                      
             }

end
