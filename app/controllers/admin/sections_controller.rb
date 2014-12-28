class Admin::SectionsController < ApplicationController
  layout "admin"
  before_filter :set_event, only: [:index, :update, :show, :new, :edit, :create, :destroy]
  before_filter :set_section, only: [:show, :update, :edit, :destroy]
  before_filter :set_set_section, only: [:index]

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

  def destroy
    @section.destroy
    redirect_to :back
  end

  private

  def section_params
    params.require(:section).permit(:title, :content)
  end

  def set_event
    @event = Event.find params[:event_id] || default_event
  end

  def set_section
    section_id = params[:section_id] || params[:id]
    @section = @event.sections.find section_id
  end

  def set_sections
    @sections = @event.sections.all
  end
end
