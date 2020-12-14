class TasksController < ApplicationController

  get "/tasks/new" do
    erb :'tasks/new'
  end 

  post "/tasks" do 
    @task = Task.create(name: params[:task], user_id: current_user.id)
    redirect "/tasks/#{@task.id}"
  end 

  get "/tasks/:id" do
    @task = Task.find(params[:id])
    
    if @task.user_id == current_user.id
      erb :'/tasks/show'
    else
      redirect '/users/index'
    end
  end

  get "/tasks" do
    @tasks = Task.all
    @user_task = []

    @tasks.each do |task|
      if task.user_id == current_user.id
        @user_task << task 
      end 
    end

    erb :'tasks/index'
  end

  get "/tasks/:id/edit" do 
    @task = Task.find(params[:id])
    erb :'/tasks/edit'
  end 

  patch "/tasks/:id" do
    @task = Task.find(params[:id])
    @task.update(name: params[:task])

    redirect "/tasks/#{@task.id}"
  end 

  delete '/tasks/:id' do 
    @task = Task.find(params[:id])
    @task.destroy  

    redirect '/tasks'
  end
end