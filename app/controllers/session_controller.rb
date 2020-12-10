require './config/environment'

class SessionController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/users/login' do 
    erb :'/users/login'
  end 

  delete '/logout' do
    session clear 
    redirect to '/welcome'
  end 
end 