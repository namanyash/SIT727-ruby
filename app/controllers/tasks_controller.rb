class TasksController < ApplicationController
    protect_from_forgery with: :null_session
    def new
        @task = Task.new
        @unfinished_tasks = Task.where(:done => false)
        @finished_tasks = Task.where(:done => true)
    end

    def create
        if params[:task][:taskDetail].empty?
            redirect_to new_task_path
            return
        end

        task = Task.new(taskDetail: params[:task][:taskDetail], done: false)
        if task.save()
            redirect_to new_task_path
        else
            render json: {message: "Task not added"}, status: :unprocessable_entity
        end
    end
    def updateTask
        task_update = Task.where(:_id => params[:value])
        if task_update.update(:done=>true)
            redirect_to new_task_path
        else
            render json: {message: "Task not added"}, status: :unprocessable_entity
        end
    end
    def deleteTask
        Task.destroy_all({:_id => params[:value]})
        redirect_to new_task_path
    end
end


