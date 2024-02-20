class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])

  end

  def new
    @task = Task.new
    # Needed to instantiate the form_with
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
    # Will raise ActiveModel::ForbiddenAttributesError
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task) # Will raise ActiveModel::ForbiddenAttributesError
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
    # No need for app/views/restaurants/destroy.html.erb
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
