class TaskListsController < ApplicationController

  before_filter :set_event, only: [:index, :show, :new, :edit]
  before_filter :set_task_list, only: [:show, :update, :edit]
  before_filter :set_task_lists, only: [:index]

  def index
  end

  def show
  end

  def new
    @task_list = TaskList.new
  end

  def create
    @task_list = TaskList.new(task_list_params)
    @task_list.save
    redirect_to :back
  end

  def edit
  end

  def update
    @task_list.update_attributes(task_list_params)
    redirect_to :back
  end

  private

  def task_list_params
    params.require(:task_list).permit(:event_id)
  end

  def set_event
    @event = Event.find params[:event_id] || default_event
  end

  def set_task_list
    @task_list = @event.task_list.find params[:id]
  end

  def set_task_lists
    @task_lists = @event.task_lists.all
  end
end
