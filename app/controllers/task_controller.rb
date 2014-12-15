class TaskController < ApplicationController

  before_filter :set_event, only: [:index, :show, :new, :edit]
  before_filter :set_task_list, only: [:index, :show, :new, :edit]
  before_filter :set_task, only: [:show, :update, :edit]
  before_filter :set_tasks, only: [:index]

  def index
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to :back
  end

  def edit
  end

  def update
    @task.update_attributes(task_params)
    redirect_to :back
  end

  private

  def task_params
    params.require(:task).permit(:event_id, :task_list_id, :description, :completed)
  end

  def set_event
    @event = Event.find params[:event_id] || default_event
  end

  def set_task_list
    @task = TaskList.find params[:task_list_id]
  end

  def set_task
    @task = @event.task.find params[:id]
  end

  def set_tasks
    @tasks = @event.tasks.all
  end
end
