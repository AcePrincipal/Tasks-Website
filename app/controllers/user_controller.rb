require './config/environment'

class UserController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/users/new' do
    erb :'/users/new'
  end 

  post '/users' do
    @user = User.new(name: params["name"], email: params["email"], password: params["password"])
    @user.save
    binding.pry 
    session[:user_id] = @user.id

    redirect '/users/#{@user.id}'
  end

  get '/users/sign_in' do
    erb :'/users/sign_in'
  end 

  ##
  post '/users' do
    @user = User.new(name: params["name"], email: params["email"], password: params["password"])
    @user.save
    binding.pry 
    session[:user_id] = @user.id

    redirect '/users/#{@user.id}'
  end

end