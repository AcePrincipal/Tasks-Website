class SessionController < ApplicationController

  get '/users/login' do 
    erb :'/users/login'
  end 

  post '/login' do 
    @user = User.find_by_name(params[:user][:name])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect to "/users/#{@user.id}"
    else
      redirect to '/users/login'
    end 
  end 

  get '/logout' do
    session.clear 
    redirect to '/'
  end 

  delete '/logout' do
    session.clear 
    redirect to '/'
  end 
end 