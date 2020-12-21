class UserController < ApplicationController

  get '/users/new' do
    erb :'/users/new'
  end 

  post '/users' do
    @user = User.new(name: params["name"], email: params["email"], password: params["password"])
    if @user.save
      session[:user_id] = @user.id
      redirect to "/users/#{@user.id}"
    else
      @error = @user.errors.full_messages.join(" - ")
      erb :'/users/new'
    end
  end

  get '/users/:id' do 
    if current_user.id == params[:id].to_i
      erb :'/users/show'
    else 
      erb :'/users/index'
    end
  end 

end
