class EventsController < ApplicationController

  before_filter :set_event, only: [:show]

  def show
  end

  private

  def set_event
    @event = Event.find params[:id]
  end

end
