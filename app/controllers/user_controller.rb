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
    if @user.save
      session[:user_id] = @user.id
      redirect to '/users/#{@user.id}'
    else
      @error = @user.errors.full_messages.join(" - ")
      erb :'/users/new'
    end
  end

  get '/users/' do 
    erb :'/users/index'
  end 

end