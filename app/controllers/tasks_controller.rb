class TasksController < ApplicationController

  get "/tasks/new" do
    erb :'tasks/new'
  end 

  get "/tasks/all" do 
    @tasks = Task.all 

    erb :'tasks/all'
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
    # @tasks = Task.all
    # @user_task = []

    @tasks = current_user.tasks

    # @tasks.each do |task|
    #   if task.user_id == current_user.id
    #     @user_task << task 
    #   end 
    # end

    erb :'tasks/index'
  end

  get "/tasks/:id/edit" do 
      @task = Task.find(params[:id])
      if current_user == @task.user
        erb :'/tasks/edit'
      else
        redirect '/users/index'
      end 
  end 

  patch "/tasks/:id" do
    @task = Task.find(params[:id])
    if current_user == @task.user
      @task.update(name: params[:task])
      redirect "/tasks/#{@task.id}"
    else
      redirect '/users/index'
    end 
  end 

  delete '/tasks/:id' do 
    @task = Task.find(params[:id])
    if current_user == @task.user
      @task.destroy  
      redirect '/tasks'
    else
      redirect '/users/index'
    end 
  end
end