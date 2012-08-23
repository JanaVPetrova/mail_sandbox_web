MailSandboxWeb::Application.routes.draw do

  namespace :api do
    resources :mail_messages, :only => [:create]
  end

  scope :module => :web do
    root :to => "welcome#index"
    resources :mail_messages, :only => [:index, :show]
    resources :mail_applications do
      resources :mail_messages, :only => [:index, :show]
    end
    resource :user, :only => [:index] do

      scope :module => :user do
        resource :session, :only => [:new, :destroy]
        resource :network, :only => [] do
          get :failure, :on => :member
        end
        resource :facebook, :only => [] do
          get :callback, :on => :member
        end
        resource :github, :only => [] do
          get :callback, :on => :member
        end
      end

    end
  end

end
