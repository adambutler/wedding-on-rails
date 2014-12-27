class GuestsController < ApplicationController

  before_filter :set_event
  before_filter :set_group
  before_filter :set_groups, only: [:index]
  before_filter :set_guest, only: [:show, :update, :edit]
  before_filter :set_guests, only: [:index]

  def index
    render json: @guests
  end

  def show
  end

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(guest_params)
    @guest.save
  end

  def edit
  end

  def update
    @guest.update_attributes(guest_params)
    render :nothing => true, :status => 200
  end

  def rsvp
    render "rsvp", layout: false if params[:raw]
  end

  private

  def guest_params
    params.require(:guest).permit(:name, :rsvp, :invited_to_ceremony, :invited_to_evening, :vegetarian, :arrival_transportation_required, :departing_transport_requred, :group_id)
  end

  def set_event
    @event = Event.find params[:event_id] || default_event
  end

  def set_group
    @group = @event.groups.find params[:group_id]
  end

  def set_groups
    @groups = @event.groups.all
  end

  def set_guest
    guest_id = params[:guest_id] || params[:id]
    @guest = @group.guests.find guest_id
  end

  def set_guests
    @guests = @group.guests.all
  end
end
