class TasksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_task, only: [:show, :edit, :update, :destroy, :new, :create]

    def index
        @user = current_user.categories.find(params[:category_id])
        @tasks = @user.tasks
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
                format.html{ redirect_to category_tasks_path(@category.id), notice: "Task was successfully added." }
            else
                format.html{ render :new, status: :unprocessable_entity }
                flash[:error] = "Please, check your input."
            end

        end
        
    end

    def destroy
        @task = @category.tasks.find(params[:id])

        respond_to do |format|

             if @task.destroy
                format.html{ redirect_to category_tasks_path(@category.id), notice: "Task was successfully deleted." }
             end

        end

       
    end

    def edit
        @task = @category.tasks.find(params[:id])
    end

    def update
        @task = @category.tasks.find(params[:id])
        
        respond_to do |format|

            if @task.update(task_params)
                format.html{ redirect_to category_tasks_path(@category.id), notice: "Task was successfully updated." }
            else
                format.html{ render :new, status: :unprocessable_entity }
                flash[:error] = "Please, check your input."
            end

        end
        
    end

    def today
        # Task.where(name: "some name")
        @today_task = current_user.tasks.where(deadline: (DateTime.current.midnight)..DateTime.current.midnight + 1)
    end

    def overdue
        @overdue_task = current_user.tasks.where("deadline < ?", DateTime.current)
    end

    private
    def set_task
        @category = current_user.categories.find(params[:category_id])
    end

    def task_params
        params.require(:task).permit(:name, :description, :deadline, :category_id)
    end
end
