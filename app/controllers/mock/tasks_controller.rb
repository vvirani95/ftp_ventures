class Mock::TasksController < ApplicationController

    def index
        @mock_tasks = MockTask.all      
    end  
    
    def show
        @mock_task = MockTask.find(params[:id])
    end  

    def new 
        @mock_task = MockTask.new
        render 'new'
    end    

    def create
        @mock_task = MockTask.new(mock_task_params)

        if @mock_task.save
            redirect_to "/mock/tasks"
        else
            render "error"
        end        
    end

    def update
        params.permit!
        @mock_task = MockTask.find(params[:id])
        if @mock_task.update(params[:mock_tasks])
            redirect_to '/mock/tasks'
        else
            puts params
        end        
    end    
    
    private 

    def mock_task_params
        params.require(:mock_tasks).permit(:task_title, :task_description, :task_complete?)
    end    
end
