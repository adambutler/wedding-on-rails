class EventsController < ApplicationController

  before_filter :set_event, only: [:show, :update]

  def show
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

end
