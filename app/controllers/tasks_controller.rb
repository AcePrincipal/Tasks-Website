class TasksController < ApplicationController

  get "/tasks" do
    erb :welcome
  end

  get "/tasks/new" do
    erb :'tasks/new'
  end 

end