class EventsController < ApplicationController

  before_filter :set_event, only: [:show, :update]
  before_filter :set_groups, only: [:show]

  def show
    @group = Group.new
  end

  def update
    @event.update_attributes(event_params)
    redirect_to :back
  end

  private

  def set_event
    @event = Event.find params[:id]
  end

  def event_params
    params.require(:event).permit(:date, :location, :active, :title)
  end

  def set_groups
    @groups = @event.groups
  end
end
