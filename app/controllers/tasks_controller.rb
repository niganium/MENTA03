class TasksController < ApplicationController
  def index
    if params[:is_finished] == "working"
      @tasks = Task.where(is_finished: "作業中")
    elsif params[:is_finished] == "finished"
      @tasks = Task.where(is_finished: "完了")
    else
      @tasks = Task.all
    end
    @task = Task.new
    @sub_id = 0
  end

  def create
    @task = Task.new(task_params)
    @task.save
    @tasks = Task.all
    @sub_id = 0
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)
    @tasks = Task.all
    @sub_id = 0
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    @tasks = Task.all
    @sub_id = 0
  end

  private
  def task_params
    params.require(:task).permit(:content, :is_finished)
  end
end
