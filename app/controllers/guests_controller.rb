class GuestsController < ApplicationController

  before_filter :set_event, only: [:index, :show, :new, :edit, :rsvp]
  before_filter :set_guest, only: [:show, :update, :edit, :rsvp]
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
    redirect_to :back
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

  def set_guest
    guest_id = params[:guest_id] || params[:id]
    @guest = @event.guests.find guest_id
  end

  def set_guests
    @guests = @event.guests.all
  end
end
