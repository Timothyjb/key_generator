class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :public_folder, 'public'
    set :session_secret, "password_security"
    set :views, 'app/views'
    set :layout, :layout
  end

  get '/' do
    redirect "/csr/new"
  end

end