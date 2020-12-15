class TasksController < ApplicationController

    def index
        if user_signed_in?
            @tasks = Task.order('tasks.id DESC').all
        else
            redirect_to '/'
        end        
    end  
    
    def show
        @task = Task.find(params[:id])
    end  

    def new 
        @task = Task.new
        render 'new'
    end    

    def create
        @task = Task.new(task_params)

        if @task.save
            redirect_to "/tasks"
        else
            render "error"
        end        
    end

    def update
        params.permit!
        @task = Task.find(params[:id])
        if @task.update(params[:tasks])
            redirect_to '/tasks'
        else
            puts params
        end        
    end    
    
    private 

    def task_params
        params.require(:tasks).permit(:task_title, :task_description, :task_complete?)
    end    
end
