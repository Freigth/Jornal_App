class TasksController < ApplicationController
    before_action :set_task

    def index
        @tasks = @category.tasks
    end

    def show
    end

    def new
        @task = @category.tasks.build
    end

    def create
        @task = @category.tasks.build(task_params)
        
        respond_to do |format|

            if @task.save
                format.html{ redirect_to category_tasks_path(@category.id), notice: "task has been sucessfully added" }
            else
                format.html{ render :new, status: :unprocessable_entity}
                flash[:error] = "Please check if your input is valid"
            end

        end
        
    end

    def destroy
        @task = @category.tasks.find(params[:id])
        @task.destroy
    end

    def edit
        @task = @category.tasks.find(params[:id])
    end

    def update
        @task = @category.tasks.find(params[:id])
        
        respond_to do |format|

            if @task.update(task_params)
                format.html{ redirect_to category_tasks_path(@category.id) }
            end

        end
        
    end

    private
    def set_task
        @category = Category.find(params[:category_id])
    end

    def task_params
        params.require(:task).permit(:name, :description, :deadline, :category_id)
    end
end
