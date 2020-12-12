class SessionController < ApplicationController

  get '/users/login' do 
    erb :'/users/login'
  end 

  post '/login' do 
    @user = User.find_by_name(params[:user][:name])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect to '/tasks'
    else
      redirect to '/users/login'
    end 
  end 


  delete '/logout' do
    session.clear 
    redirect to '/'
  end 
end 