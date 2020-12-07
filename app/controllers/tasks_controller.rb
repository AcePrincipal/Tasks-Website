require './config/environment'

class TasksController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/:id/tasks" do
    erb :welcome
  end

  get "/:id/tasks/new" do
    erb :'tasks/new'
  end 

end