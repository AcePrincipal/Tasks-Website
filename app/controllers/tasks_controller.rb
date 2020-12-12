class TasksController < ApplicationController

  get "/tasks" do
    @tasks = Task.all 
    erb :'tasks/index'
  end

  get "/tasks/new" do
    erb :'tasks/new'
  end 

  get "/tasks/:id" do
  end

  post "/tasks" do 
  end 

  patch "/tasks/:id" do
  end 

  get "/tasks/:id/edit" do 
  end 

end