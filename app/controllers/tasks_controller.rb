class TasksController < ApplicationController
  def index
    if params[:is_finished] == "working"
      session[:is_finished] = "working"
    elsif params[:is_finished] == "finished"
      session[:is_finished] = "finished"
    else
      session[:is_finished] = "all"
    end
    task_where
    @task = Task.new
    @sub_id = 0
  end

  def create
    @task = Task.new(task_params)
    @task.save
    task_where
    @sub_id = 0
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)
    task_where
    @sub_id = 0
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    task_where
    @sub_id = 0
  end

  private
  def task_where
    if session[:is_finished] == "working"
      @tasks = Task.where(is_finished: "working")
    elsif session[:is_finished] == "finished"
      @tasks = Task.where(is_finished: "finished")
    else
      @tasks = Task.all
    end
  end

  def task_params
    params.require(:task).permit(:content, :is_finished)
  end
end
