class SectionsController < ApplicationController

  before_filter :set_event, only: [:index, :show, :new, :edit, :create]
  before_filter :set_guest, only: [:show, :update, :edit]
  before_filter :set_guests, only: [:index]

  def index
  end

  def show
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)
    @section.event_id = @event.id
    @section.save
    redirect_to :back
  end

  def edit
  end

  def update
    @section.update_attributes(section_params)
    redirect_to :back
  end

  private

  def section_params
    params.require(:section).permit(:title, :content)
  end

  def set_event
    @event = Event.find params[:event_id] || default_event
  end

  def set_guest
    guest_id = params[:guest_id] || params[:id]
    @section = @event.guests.find guest_id
  end

  def set_guests
    @sections = @event.guests.all
  end
end
